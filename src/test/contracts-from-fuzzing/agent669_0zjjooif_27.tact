struct ManyOptionDefaults {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
}

contract OptionDefaultsHolder {
    val: ManyOptionDefaults;

    init() {
        self.val = ManyOptionDefaults{
            a:null, b:null, c:null, d:null
        };
    }
}