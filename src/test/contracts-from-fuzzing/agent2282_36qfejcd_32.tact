struct AllOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test28 {
    s: AllOptional;

    init() {
        self.s = AllOptional{ a:null, b:null, c:null };
    }
}