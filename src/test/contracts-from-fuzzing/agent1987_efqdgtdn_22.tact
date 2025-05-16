struct OnlyOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract AllOptionalFields {
    s: OnlyOptionals;
    init() {
        self.s = OnlyOptionals{
            a:null, b:"text", c:null
        };
    }
}