struct BigNester {
    f1: Int;
    f2: BigNestedInner;
}

struct BigNestedInner {
    i1: Int;
    i2: BigDeep;
}

struct BigDeep {
    z: Int;
}

contract DeepField {
    state: BigNester;

    init() {
        self.state = BigNester{
            f1: 1,
            f2: BigNestedInner{
                i1: 2,
                i2: BigDeep{
                    z: 3
                }
            }
        };
    }
}
