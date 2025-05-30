struct Wrap {
    val: Int?;
}

struct Container {
    a: Wrap?;
    b: Bool;
}

contract OptInStruct {
    f: Container;

    init() {
        self.f = Container{ a: null, b: true };
    }
}