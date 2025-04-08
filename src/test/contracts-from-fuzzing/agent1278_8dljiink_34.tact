struct LotsOfOptions {
    s1: String?;
    s2: String?;
    s3: String?;
    s4: String?;
    s5: String?;
    s6: String?;
    s7: String?;
    s8: String?;
    s9: String?;
    s10: String?;
}

contract TestContract {
    options: LotsOfOptions;

    init() {
        self.options = LotsOfOptions{
            s1: null, s2: "hi", s3: null, s4: null, s5: "x",
            s6: null, s7: "y", s8: null, s9: "z", s10: null,
        };
    }
}