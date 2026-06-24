message(42) Payload {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    stored: Payload = Payload{foo: 1, bar: true};
    init() {}
}