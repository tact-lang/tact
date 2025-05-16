struct DeepInner {
    a: Int?;
    b: Bool?;
}

struct Middle {
    c: DeepInner?;
    s: String?;
}

contract DeepOptionalTest {
    data: Middle?;

    init() {
        self.data = Middle{
            c: null,
            s: null,
        };
    }
}