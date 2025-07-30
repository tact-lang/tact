message(0x1) MyMsg {
    foo: Int = 10;
    bar: String = "test";
}

contract TestContract {
    myOptMsg: MyMsg?;

    init() {
        self.myOptMsg = null;
    }
}