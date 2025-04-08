struct XtraDeep {
    a: Nested1;
}

struct Nested1 {
    b: Nested2;
}

struct Nested2 {
    c: Nested3;
}

struct Nested3 {
    d: Nested4;
}

struct Nested4 {
    e: Nested5;
}

struct Nested5 {
    z: Int;
}

contract DeepNestStructField {
    myfield: XtraDeep;
    init() {
        self.myfield = XtraDeep{
            a: Nested1{
                b: Nested2{
                    c: Nested3{
                        d: Nested4{
                            e: Nested5{
                                z: 123
                            }
                        }
                    }
                }
            }
        };
    }
}