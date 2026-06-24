// Optional of struct containing another optional struct field
struct InnerOpt {
    foo: Int?;
}

struct OuterOpt {
    bar: InnerOpt?;
}

contract OptTest {
    data: OuterOpt?;

    init() {
        self.data = OuterOpt{
            bar: InnerOpt{ foo: 100 }
        };
    }
}