struct InnerA {
    a: Int = 1;
    o: Int? = null;
}

struct InnerB {
    b: Bool = true;
    i: InnerA = InnerA{};
}

struct Outer {
    val: InnerB = InnerB{};
    message: String = "message";
}

contract NestedMix {
    mixed: Outer = Outer{};
}