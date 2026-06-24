struct NestedArrays {
    a: InnerA;
}

struct InnerA {
    b: InnerB;
}

struct InnerB {
    c: InnerC;
}

struct InnerC {
    d1: Int;
    d2: Int?;
    d3: Bool;
    d4: Bool?;
    d5: Address;
    d6: Address?;
}

contract TestContract {
    s: NestedArrays;

    init() {
        self.s = NestedArrays{
            a: InnerA{
                b: InnerB{
                    c: InnerC{
                        d1:1,d2:null,d3:true,d4:null,d5:myAddress(),d6:null
                    }
                }
            }
        };
    }
}