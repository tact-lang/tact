struct StrVariants {
    a: String;
    b: String?;
    c: String = "foo";
}

contract StringVariants {
    data: StrVariants;
    init() {
        self.data = StrVariants{ a:"hi", b:null, c:"bar" };
    }
}