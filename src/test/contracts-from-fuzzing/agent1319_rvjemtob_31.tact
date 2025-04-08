struct NestOptInner {
    a: Int?;
    b: Bool?;
}

struct NestOptOuter {
    inner: NestOptInner;
    flag: Bool?;
}

contract NestOptSeparatedTest {
    data: NestOptOuter;
    init() {
        self.data = NestOptOuter {
            inner: NestOptInner { a: null, b: null },
            flag: null
        };
    }
}