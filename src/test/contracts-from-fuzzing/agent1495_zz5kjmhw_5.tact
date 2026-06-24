struct Deep {
    nested: Struct1;
}

struct Struct1 {
    nested: Struct2;
}

struct Struct2 {
    nested: Struct3;
}

struct Struct3 {
    nested: Struct4;
}

struct Struct4 {
    value: Int;
}

contract ManyDeepNestedTest {
    d: Deep;

    init() {
        self.d = Deep{
            nested: Struct1{
                nested: Struct2{
                    nested: Struct3{
                        nested: Struct4{
                            value: 999
                        }
                    }
                }
            }
        };
    }
}
