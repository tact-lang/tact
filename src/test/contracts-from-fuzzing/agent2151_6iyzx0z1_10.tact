struct Optionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract AllOptional {
    data: Optionals;

    init() {
        self.data = Optionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}