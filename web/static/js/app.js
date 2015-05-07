import {Socket} from "phoenix"

todoListContainer = $("#todo_items_container")
outstandingList = $("#outstanding_list")
newItem = $("#new_item")

let socket = new Socket("/ws")
socket.connect()
socket.join("to_dos", {}).receive("ok", chan => {
  console.log("Todo App is working")

  newItem.off("keypress").on("keypress", event => {
    if(event.keyCode === 13) {
      chan.push("item:create", {description: newItem.val()})
      newItem.val("")
    }
  })

  chan.on("item:create", payload => {
    outstandingList.append("hello")
  })

})

let TodoApp = {

}

export default TodoApp
