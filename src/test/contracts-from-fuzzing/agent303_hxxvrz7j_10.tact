struct DeeplyNestedA {
    b: DeeplyNestedB;
}

struct DeeplyNestedB {
    c: DeeplyNestedC;
}

struct DeeplyNestedC {
    d: DeeplyNestedD;
}

struct DeeplyNestedD {
    e: DeeplyNestedE;
}

struct DeeplyNestedE {
    x: Int;
}

contract Nested5 {
    data: DeeplyNestedA;

    init() {
        self.data = DeeplyNestedA{
            b: DeeplyNestedB{
                c: DeeplyNestedC{
                    d: DeeplyNestedD{
                        e: DeeplyNestedE{
                            x: 99
                        }
                    }
                }
            }
        };
    }
}