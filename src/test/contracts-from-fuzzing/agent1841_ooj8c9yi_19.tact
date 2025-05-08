struct MiddleOptional {
    a: Int;
    b: Bool?;
    c: String;
}

contract MiddleOptionalTest {
    val: MiddleOptional;

    init() {
        self.val = MiddleOptional{
            a: 1,
            b: null,
            c: "text"
        };
    }
}
