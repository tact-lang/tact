struct EmptyOptionals {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    opt1: EmptyOptionals? = null;
    init() {}
    receive() {}
}