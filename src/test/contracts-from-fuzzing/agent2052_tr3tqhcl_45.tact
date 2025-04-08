struct MiddleLevel {
    x: Int?;
    y: Bool?;
}

struct OuterLevel {
    inner: MiddleLevel?;
    s: String;
}

contract PartialNestedNullTest {
    data: OuterLevel;

    init() {
        self.data = OuterLevel{
            inner: null,
            s: "abc"
        };
    }
}