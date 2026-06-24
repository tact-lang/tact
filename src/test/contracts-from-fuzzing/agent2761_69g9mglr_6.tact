struct InnerMost2 {
    z: Int?;
}

struct Inner2 {
    y: InnerMost2?;
}

struct TestStruct {
    a: Int;
    b: Bool?;
    c: String;
    d: Inner2;
}

contract MixedOptionalsNestedTest {
    s: TestStruct;
    init() {
        self.s = TestStruct{
            a: 1,
            b: null,
            c: "hi",
            d: Inner2{ y: null }
        };
    }
}
