struct MixedDefaults {
    a: Int;
    b: Int = 3;
    c: Int?;
    d: Int? = null;
    e: Bool = false;
}

contract TestContract {
    data: MixedDefaults;

    init() {
        self.data = MixedDefaults{ a:1, c:null };
    }
}