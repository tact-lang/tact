struct OneOptional {
    opt: Inner?;
}

struct Inner {
    param: String;
    val: Int;
}

contract OptionalInnerTest {
    s: OneOptional;

    init() {
        self.s = OneOptional{
            opt: null
        };
    }
}