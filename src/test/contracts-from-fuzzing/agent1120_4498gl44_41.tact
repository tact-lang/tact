struct MixedDefaults {
    a: Int = 5;
    b: Bool?;
    c: String = "hi";
    d: Bool;
}

contract HybridDefaults {
    data: MixedDefaults;
    init() {
        self.data = MixedDefaults{b:null,d:true};
    }
}