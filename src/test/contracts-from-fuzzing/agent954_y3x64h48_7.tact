struct Middle {
    some: Int;
    other: Bool;
}

struct Outer {
    m: Middle;
    optionalStr: String?;
}

contract OptionalNested {
    data: Outer = Outer{m: Middle{some: 5, other: true}, optionalStr: null};

    init() {}
}