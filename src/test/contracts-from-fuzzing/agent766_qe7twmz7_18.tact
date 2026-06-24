struct Mixed {
    a: Int? = null;
    b: Bool = true;
    c: String?;
    d: Int = 100;
}

contract MixDefaultsNested {
    val: Mixed = Mixed{};
    init() {
        self.val = Mixed{ a: 7, b: false, c: "hi", d: 55 };
    }
}