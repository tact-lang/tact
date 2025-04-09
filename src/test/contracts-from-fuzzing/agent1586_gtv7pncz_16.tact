struct SDefault {
    x: Int = 10;
    y: Bool = false;
    z: String = "abc";
}

contract StructWithDefaults {
    val: SDefault;

    init() {
        self.val = SDefault {};
    }
}