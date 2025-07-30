// Test optional struct field
struct InnerOpt {
    x: Int;
}

struct Container {
    optInner: InnerOpt?;
    txt: String;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            optInner: null,
            txt: "hello"
        };
    }
}