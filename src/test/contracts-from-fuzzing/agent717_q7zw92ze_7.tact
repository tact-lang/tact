struct DeepOptionals {
    level1: Int?;
    level2: String?;
    level3: Bool?;
}

struct Wrapper {
    wrapped: DeepOptionals;
}

contract OptionalNestedTest {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            wrapped: DeepOptionals{
                level1: null,
                level2: "hi",
                level3: null
            }
        };
    }
}