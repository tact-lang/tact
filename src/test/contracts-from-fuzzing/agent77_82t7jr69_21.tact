message(123) InnerMsg {
    foo: Int;
}

struct Wrapped {
    inner: InnerMsg;
    flag: Bool;
}

contract TestContract {
    store: Wrapped = Wrapped{inner: InnerMsg{foo: 5}, flag: true};
    init() {}
}