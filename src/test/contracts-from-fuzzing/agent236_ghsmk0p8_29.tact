message(3) MyMsg {
    foo: Int;
}

contract TestContract {
    optionalMsg: MyMsg?;

    init() {
        self.optionalMsg = null;
    }
}