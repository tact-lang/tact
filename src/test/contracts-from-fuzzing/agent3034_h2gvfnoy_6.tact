struct DeepOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Container {
    x: Int = 0;
    opt: DeepOptionals;
}

contract DeepOptionalTest {
    store: Container;

    init() {
        self.store = Container{
            x: 42,
            opt: DeepOptionals{
                a: null,
                b: null,
                c: "deep"
            }
        };
    }
}