message Msg {
  from: Address;
  payload: MsgPayload;
}

message MsgPayload {
  amount: Int;
}

contract Test {
  receive(msg: Msg) {
    let amt = msg.payload.amount;
  }
}