message(100) MyMsg {
    foo: Int;
    bar: Bool;
}

contract MessageField {
    lastMsg: MyMsg = MyMsg{foo: 0, bar: false};
}