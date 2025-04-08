struct Inner {
    foo: Int as uint8;
    bar: Bool?;
}

contract TestContract {
    complexOpt: Inner? = null;
}