struct NestedDefaults {
    a: Int = 1;
    b: SubDef;
}

struct SubDef {
    c: Bool = true;
    d: String = "hi";
}

contract DeepDefaults {
    val: NestedDefaults;

    init() {
        self.val = NestedDefaults{
            b: SubDef{}
        };
    }
}