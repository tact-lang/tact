struct InnerMostField {
    a: Int;
    b: Bool;
}

struct MiddleLayer {
    inner: InnerMostField;
}

struct TopLayer {
    mid: MiddleLayer;
}

contract SuperNesting {
    state: TopLayer;

    init() {
        self.state = TopLayer{
            mid: MiddleLayer{
                inner: InnerMostField{
                    a: 777, b: true
                }
            }
        };
    }
}
