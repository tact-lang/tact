message MyMessage {}

contract MultipleReceivers {
    receive(msg: MyMessage) {}
    receive(slice: Slice) {}
}
