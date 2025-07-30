struct StructA {
    x: Int?;
    y: String?;
    z: Bool?;
}

struct StructB {
    a: StructA?;
    b: Int;
}

contract OptionalStructs {
    val: StructB?;

    init() {
        self.val = null;
    }
}