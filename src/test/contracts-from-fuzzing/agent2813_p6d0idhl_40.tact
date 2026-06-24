struct BigDefaultsNested {
    a: Int = 1;
    b: SubDefault;
}

struct SubDefault {
    c: Int = 2;
    d: Bool = false;
    e: String = "hi";
}

contract TestBigDefaultsNested {
    val: BigDefaultsNested;
    init() {
        self.val = BigDefaultsNested{
            b: SubDefault{}
        };
    }
}
