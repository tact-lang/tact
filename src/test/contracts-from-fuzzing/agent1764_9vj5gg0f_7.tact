struct Payload {
    foo: Int;
    bar: String;
}

contract TestContract {
    payload: Payload?;

    init() {
        self.payload = null;
    }
}
