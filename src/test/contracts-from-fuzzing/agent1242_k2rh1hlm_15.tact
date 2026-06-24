struct MixedDefaults {
    a: Int;
    b: Bool = false;
    c: Int?;
    d: String = "default";
    e: Int? = null;
}

contract TestContract {
    data: MixedDefaults;

    init() {
        self.data = MixedDefaults{
            a:123,
            c:null,
        };
    }
}