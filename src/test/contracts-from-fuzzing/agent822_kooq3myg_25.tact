message MyMsg {
    val: Int;
}

contract TestContract {
    m: MyMsg;

    init() {
        self.m = MyMsg{ val: 42 };
    }
}
