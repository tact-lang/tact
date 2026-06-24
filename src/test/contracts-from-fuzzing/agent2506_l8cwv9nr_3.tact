struct OptionalDeep {
    s: String?;
    flag: Bool?;
    val: Int?;
}

struct OptContainer {
    inner: OptionalDeep?;
    message: String;
}

contract OptionalDeepTest {
    data: OptContainer;

    init() {
        self.data = OptContainer{
            inner: null,
            message: "hello",
        };
    }
}
