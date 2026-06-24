struct OneDeep {
    val: Int;
}

struct TwoDeep {
    one: OneDeep;
}

struct ThreeDeep {
    two: TwoDeep;
}

contract Test {
    deep: ThreeDeep;

    init() {
        self.deep = ThreeDeep{
            two: TwoDeep{
                one: OneDeep{
                    val: 42
                }
            }
        };
    }
}