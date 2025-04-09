struct DeepNest3 {
    a: Int?;
    b: String?;
}

struct DeepNest2 {
    x: DeepNest3?;
    y: Int?;
}

struct DeepNest1 {
    inner: DeepNest2?;
    flag: Bool?;
}

contract DeepOptionalNestedTest {
    data: DeepNest1;

    init() {
        self.data = DeepNest1{
            inner: null,
            flag: null
        };
    }
}