struct EmptyStringVariants {
    a: String;
    b: String = "";
    c: String? = null;
    d: String?;
}

contract TestContract {
    s: EmptyStringVariants;

    init() {
        self.s = EmptyStringVariants{
            a: "",
            d: null
        };
    }
}