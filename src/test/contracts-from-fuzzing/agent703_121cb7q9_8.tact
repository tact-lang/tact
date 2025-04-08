struct Payload {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    data: Payload?;

    init() {
        self.data = null;
    }
}