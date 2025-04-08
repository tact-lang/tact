struct InnerD {
    z: Int = 99;
}

struct MidD {
    y: InnerD = InnerD{};
}

struct OuterD {
    x: MidD = MidD{};
}

contract TransitiveDefaults {
    data: OuterD = OuterD{};
}