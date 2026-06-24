struct Middle {
    m: Int;
}

struct Outer {
    o1: Middle;
    o2: Int;
}

contract NestedWithFields {
    val: Outer = Outer{
        o1: Middle{ m: 8 },
        o2: 9
    };
    x: Int = 5;
    y: Bool = false;
}