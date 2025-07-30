struct OnlyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
}

contract AllOptionalFields {
    data: OnlyOptionals;

    init() {
        self.data = OnlyOptionals{
            a: null, b: null, c: null, d: null, e: null 
        };
    }
}