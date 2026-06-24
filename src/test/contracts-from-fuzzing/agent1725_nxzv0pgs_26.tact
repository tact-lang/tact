struct StringMix {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
}

contract TestContract {
    val: StringMix;

    init() {
        self.val = StringMix{
            s1: "a",
            s2: null,
            s3: "b",
            s4: "c"
        };
    }
}