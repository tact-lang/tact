struct S {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract AllOptionalStruct {
    val: S?;

    init() {
        self.val = S{
            a: 5,
            b: true,
            c: null
        };
    }
}