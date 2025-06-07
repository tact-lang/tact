struct Middle {
    a: Int = 10;
    b: Bool = false;
}

struct Outer {
    mid: Middle;
    c: Int = 20;
}

contract StructWithOptional {
    val: Outer?;
    init() {}
}