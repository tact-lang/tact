struct OptInner {
    x: Int?;
    y: Bool?;
}

struct NestOptInner {
    inner: OptInner?;
}

contract FieldOptInnerTest {
    data: NestOptInner;

    init() {
        self.data = NestOptInner{
            inner: null,
        };
    }
}