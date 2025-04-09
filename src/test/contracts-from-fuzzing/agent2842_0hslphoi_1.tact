struct NestedDeep {
    inner: InnerStruct;
}

struct InnerStruct {
    n: Innermost;
}

struct Innermost {
    a: Int;
    b: Bool?;
    s: String;
}

contract NestedTest {
    data: NestedDeep;

    init() {
        self.data = NestedDeep{
            inner: InnerStruct{
                n: Innermost{
                    a: 123,
                    b: true,
                    s: "hello"
                }
            }
        };
    }
}