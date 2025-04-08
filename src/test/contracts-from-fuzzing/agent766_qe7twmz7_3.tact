struct InnerMost {
    val: Int = 7;
    flag: Bool?;
}

struct Middle {
    inner: InnerMost = InnerMost{};
    text: String = "hello";
    maybe: Int?;
}

struct Outer {
    mid: Middle = Middle{};
    number: Int = 100;
}

contract DeepStructTest {
    nested: Outer = Outer{};
    init() {
        self.nested = Outer{
            mid: Middle{
                inner: InnerMost{ val: 99, flag: true },
                text: "updated",
                maybe: 123
            },
            number: 456
        };        
    }
}