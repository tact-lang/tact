// optional struct field in contract
struct S {
    foo: Int;
}

contract OptAtTop {
    bar: S?;

    init() {
        self.bar = null;
    }
}