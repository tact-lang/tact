struct LargeNestedChain {
    sub1: Nested1;
}

struct Nested1 {
    sub2: Nested2;
}

struct Nested2 {
    sub3: Nested3;
}

struct Nested3 {
    sub4: Nested4;
}

struct Nested4 {
    sub5: Nested5;
}

struct Nested5 {
    leaf: Int;
}

contract BigNestedStruct {
    data: LargeNestedChain;

    init() {
        self.data = LargeNestedChain{
            sub1: Nested1{
                sub2: Nested2{
                    sub3: Nested3{
                        sub4: Nested4{
                            sub5: Nested5{
                                leaf: 123
                            }
                        }
                    }
                }
            }
        };
    }
}