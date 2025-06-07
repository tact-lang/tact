struct Wrap {
    s: StructWithDefault;
}

struct StructWithDefault {
    a: Int = 10;
    b: Bool = true;
    c: String = "ok";
}

contract StructWithDefaultField {
    val: Wrap;

    init() {
        self.val = Wrap{s: StructWithDefault{}};
    }
}
