// test contract with nested struct inside optional inside nested struct
struct InnerX {
    foo: Int?;
}

struct MiddleX {
    bar: InnerX?;
}

contract DeepOptionNest {
    x: MiddleX?;

    init() {
        self.x = null;
    }
}