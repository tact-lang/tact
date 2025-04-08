struct StringVariants {
    s1: String;
    s2: String?;
    s3: String = "default";
    s4: String? = null;
}

contract TestContract {
    s: StringVariants;

    init() {
        self.s = StringVariants{
            s1: "set"
        };
    }
}