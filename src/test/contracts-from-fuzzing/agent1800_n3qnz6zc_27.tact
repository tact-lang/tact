struct Inner {
    foo: Int;
    bar: Bool;
    text: String;
}

contract NestedStructOpt {
    innerOpt: Inner?;

    init() {
        self.innerOpt = null;
    }
}