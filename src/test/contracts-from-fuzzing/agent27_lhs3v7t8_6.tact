message Outer {
   msg: Inner;
}

message Inner {
   value: Int;
}

contract Test {
   receive(message: Outer) {
      let x = message.msg.value;
   }
}