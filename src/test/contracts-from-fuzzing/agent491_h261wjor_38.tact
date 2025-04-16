// optional field default in struct
struct S2 {
    z: Int? = null;
    s: String? = null;
}

contract StructOptionalDefaults {
    val: S2;
    init() {
        self.val = S2{};
    }
}