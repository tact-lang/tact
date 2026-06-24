struct Sub {
    flag: Bool;
}

struct Container {
    val: Int;
    optSub: Sub?;
}

contract OptionalNestedStructField {
    cont: Container;

    init() {
        self.cont = Container{ val: 1, optSub: null };
    }
}
