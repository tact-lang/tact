struct Inner {
    a: Int;
    b: Bool;
}

struct Wrapper {
    data: Inner;
    opt: String?;
}

contract NestedOptionalWrap {
    val: Wrapper?;
    init() {
        self.val = Wrapper{
            data: Inner{
                a: 123,
                b: true
            },
            opt: null
        };
    }
}