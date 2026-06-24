struct StrDefaults {
    s1: String;
    s2: String = "default";
    s3: String?;
    s4: String? = null;
}

contract TestContract {
    val: StrDefaults;
    init() {
        self.val = StrDefaults{
            s1: "explicit",
            s3: null
        };
    }
}
