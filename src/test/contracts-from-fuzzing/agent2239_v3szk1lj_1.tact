struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    field: Inner;
    flag: Bool;
}

contract NestedOptionals {
    storage: Outer;

    init() {
        self.storage = Outer{
            field: Inner{x: 5, y: null},
            flag: true
        };
    }
}