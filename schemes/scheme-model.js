const db = require("../data/config");

async function find() {
  const schemes = await db("schemes");
  return schemes;
}

async function findById(id) {
  const scheme = await db("schemes as sc").where("sc.id", id);
  return scheme
}

async function findSteps(id){
    const steps = await db("steps as st")
    .innerJoin("schemes as sc", "sc.id", "st.scheme_id")
    .where("st.scheme_id", id)
    .select("st.id", "sc.scheme_name", "st.step_number", "st.instructions")
    .orderBy("st.step_number")
    
    return steps
}

async function add(scheme){
    const [id] = await db("schemes")
    .insert(scheme)
    return findById(id)
}

async function update(changes, id){
    const redo = await db("schemes").where("id", id).update(changes)
    
    return redo
}

async function remove(id){
    await db("schemes").where("id", id).del()
    
 }
module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove
};
