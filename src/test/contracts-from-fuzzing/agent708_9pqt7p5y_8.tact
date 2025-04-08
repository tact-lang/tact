struct OptionalNested {
    n: Int?;
    b: Bool?;
    s: String?;
}

struct WrapOptional {
    inner: OptionalNested?;
    flag: Bool;
}

contract OptNest {
    val: WrapOptional;

    init() {
        self.val = WrapOptional{
            inner: null,
            flag: false
        };
    }
}
