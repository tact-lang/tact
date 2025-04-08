message(0xABCD) DataMsg {
    number: Int;
    text: String;
}

contract TestContract {
    maybeMsg: DataMsg?;

    init() {
        self.maybeMsg = null;
    }

    receive() {}
}