struct MixOptionalsDefaults {
    a: Int?;
    b: Bool = false;
    c: String?;
    d: String = "hi";
}

contract MixODContract {
    val: MixOptionalsDefaults;

    init() {
        self.val = MixOptionalsDefaults{
            a:null,
            c:"test"
        };
    }
}