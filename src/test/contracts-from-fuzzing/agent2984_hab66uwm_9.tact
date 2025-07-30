struct MyMsg {
    x: Int;
}

contract Test10 {
    data: MyMsg?;
    flag: Bool;

    init() {
        self.data = null;
        self.flag = true;
    }
}
