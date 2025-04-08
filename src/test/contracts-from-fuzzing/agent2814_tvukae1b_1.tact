struct Nested {
    inner: InnerOpt;
}

struct InnerOpt {
    x: Int?;
    y: Int? = null;
}

contract DeepOptionalTest {
    data: Nested;

    init() {
        self.data = Nested{
            inner: InnerOpt{ x: null, y: null }
        };
    }
}