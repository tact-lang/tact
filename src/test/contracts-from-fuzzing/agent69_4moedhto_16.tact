struct EmptyOptional {
    inner: InnerOpt?;
}

struct InnerOpt {
    a: Int?;
    b: String?;
}

contract EmptyOptionalTest {
    data: EmptyOptional;

    init() {
        self.data = EmptyOptional{
            inner: null
        };
    }
}