struct BigNestedA { a: Int; }
struct BigNestedB { b: BigNestedA; }
struct BigNestedC { c: BigNestedB; }
struct BigNestedD { d: BigNestedC; }
struct BigNestedE { e: BigNestedD; }

contract BigNest {
    state: BigNestedE;

    init() {
        self.state = BigNestedE{
            e: BigNestedD{
                d: BigNestedC{
                    c: BigNestedB{
                        b: BigNestedA{ a: 123 }
                    }
                }
            }
        };
    }
}