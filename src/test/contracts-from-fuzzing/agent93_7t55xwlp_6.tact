struct Variant1 {
    v1: Int;
}

struct Variant2 {
    v2: Int;
    v3: String;
}

contract StructVariants {
    s1: Variant1 = Variant1{ v1: 1 };
    s2: Variant2 = Variant2{ v2: 2, v3: "two" };
}