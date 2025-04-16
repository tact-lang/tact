// Optional message struct as field
message(55) MyMessage {
    foo: Int;
}

contract TestContract {
    optMsg: MyMessage?;

    init() {
        self.optMsg = null;
    }
}