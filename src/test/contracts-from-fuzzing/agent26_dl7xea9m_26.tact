struct NestedDef {
    val: Int = 7;
    flag: Bool = false;
}

struct OuterDef {
    nest: NestedDef = NestedDef{};
    txt: String = "hello";
}

contract Test {
    data: OuterDef;
    init() {
        self.data = OuterDef{};
    }
}