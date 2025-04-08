message(11) Payload {
    val: Int;
    txt: String;
}

contract TestContract {
    payload: Payload?;

    init() {
        self.payload = null;
    }

    receive() {}
}