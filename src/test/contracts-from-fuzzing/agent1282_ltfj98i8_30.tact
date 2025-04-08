// Structs with optional nested structs containing optional fields
struct Sub {
    val: Int?;
}
struct Mid {
    sub: Sub?;
}

contract OptNestedStructs {
    mid1: Mid?;
    mid2: Mid?;

    init() {
        self.mid1 = null;
        self.mid2 = null;
    }
}