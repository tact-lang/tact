struct NestedDeep1 {
    x: Int;
}

struct NestedDeep2 {
    n: NestedDeep1;
}

struct NestedDeep3 {
    n: NestedDeep2;
}

struct NestedDeep4 {
    n: NestedDeep3;
}

struct NestedDeep5 {
    n: NestedDeep4;
}

contract Nest5Levels {
    data: NestedDeep5;

    init() {
        self.data = NestedDeep5 {
            n: NestedDeep4 {
                n: NestedDeep3 {
                    n: NestedDeep2 {
                        n: NestedDeep1{
                            x: 123
                        }
                    }
                }
            }
        };
    }
}