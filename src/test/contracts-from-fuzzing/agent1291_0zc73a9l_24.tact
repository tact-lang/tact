struct MsgData {
  sender: Address;
  amount: Int as coins;
  payload: Cell;
}

contract Holder {
  data: MsgData;

  init() {
    self.data = MsgData{
        sender: myAddress(),
        amount: ton("1"),
        payload: emptyCell()
    };
  }
}