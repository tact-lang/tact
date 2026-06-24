struct Deep {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: Inner;
}

struct Inner {
    x: Int;
    y: EvenInner;
}

struct EvenInner {
    p: Int;
    q: Final;
}

struct Final {
    z: Bool?
}

contract HugeNestedOptional {
    value: Deep?;

    init() {
        self.value = null;
    }
}