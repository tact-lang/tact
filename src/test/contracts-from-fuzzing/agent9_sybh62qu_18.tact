struct InnerMost {
    value: Int;
}

struct Mid1 {
    part: InnerMost;
}

struct Mid2 {
    part: Mid1;
}

struct Mid3 {
    part: Mid2;
}

contract ComplexNested {
    field: Mid3?;
    init() {
        self.field = Mid3{
            part: Mid2{
                part: Mid1{
                    part: InnerMost{ value: 55 }
                }
            }
        };
    }
}