struct DeepOptional {
    a: Int?;
    b: Int?;
    c: Int?;
}

struct Wrapper {
    inner: DeepOptional;
    val: Int;
}

contract OptWrap {
    storage: Wrapper;

    init() {
        self.storage = Wrapper{
            inner: DeepOptional{
                a: null,
                b: null,
                c: 123
            },
            val: 99
        };
    }
}