struct Combo {
    x: Int;
    y: Bool?;
    z: Inner?;
}

struct Inner {
    foo: Int;
    bar: Bool;
}

contract ComboContract {
    field: Combo?;

    init() {
        self.field = null;
    }
}