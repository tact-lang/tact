struct InnerStruct {
    a: Int = 1;
    b: Bool = false;
}

struct MiddleStruct {
    inner: InnerStruct;
    optInt: Int?;
}

struct OuterStruct {
    m: MiddleStruct;
    text: String = "hello";
}

contract NestedTest {
    storage: OuterStruct;

    init() {
        self.storage = OuterStruct{
            m: MiddleStruct{
                inner: InnerStruct{ a: 42, b: true },
                optInt: null,
            },
            text: "world",
        };
    }

    receive() {
        let _ = self.storage;
    }
}