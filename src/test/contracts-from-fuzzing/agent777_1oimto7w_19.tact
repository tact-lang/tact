struct ManyOptional {
    a: Int?;
    b: String?;
    c: Int?;
    d: Bool?;
    e: String?;
}

contract ManyOptionalContract {
    val: ManyOptional;

    init() {
        self.val = ManyOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}