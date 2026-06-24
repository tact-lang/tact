struct NestedA {
    field: NestedB;
}

struct NestedB {
    field: NestedC;
}

struct NestedC {
    field: NestedD;
}

struct NestedD {
    field: NestedE;
}

struct NestedE {
    field: Int;
}

contract Deep {
    top: NestedA;

    init() {
        self.top = NestedA{
            field: NestedB{
                field: NestedC{
                    field: NestedD{
                        field: NestedE{
                            field: 123
                        }
                    }
                }
            }
        };
    }
}
