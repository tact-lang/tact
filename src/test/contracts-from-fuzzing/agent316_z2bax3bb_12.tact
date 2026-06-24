struct InnerMost {
    x: String;
}

struct MiddleOpt {
    payload: InnerMost?;
}

struct Outer {
    content: MiddleOpt;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            content: MiddleOpt{
                payload: null
            }
        };
    }
}
