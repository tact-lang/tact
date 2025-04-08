// Complex struct with nested optional structs mixing default and explicit null
struct DeepOpt {
    x: Int?;
    y: String? = null;
}

struct Container {
    inner: DeepOpt?;
    flag: Bool = true;
}

contract MixEdgeCase {
    data: Container;

    init() {
        self.data = Container{
            inner: null
        };
    }
}
