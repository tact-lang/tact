struct Inner {
    a: Int?;
    b: Bool;
}

struct Outer {
    point: Inner;
    note: String?;
}

contract OptionalNestedStructs {
    data: Outer = Outer{
        point: Inner{a: null, b: true},
        note: null
    };

    init() {}
}