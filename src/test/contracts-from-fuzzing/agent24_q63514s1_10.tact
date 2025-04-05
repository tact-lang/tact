message SliceMessage {
    data: Slice;
}

contract TestContract {
    receive(msg: SliceMessage) {
    }
}