struct DeepOptional {
    a: Int?;
    b: OptionalInner?;
}

struct OptionalInner {
    name: String;
    flag: Bool;
}

contract OptTest {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            a: null,
            b: null,
        };
    }
}