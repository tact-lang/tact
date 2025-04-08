struct Inner {
    val: Int;
}

message MyMsg {
    nested: Inner;
    flag: Bool;
}

contract TestContract {
    m: MyMsg = MyMsg{nested: Inner{val: 9}, flag: true};

    init() {}

    receive() {
        dump(self.m.nested.val);
        dump(self.m.flag);
    }
}