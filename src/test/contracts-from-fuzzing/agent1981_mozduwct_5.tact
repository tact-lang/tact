struct OneField {
    x: Int;
}

struct TwoField {
    a: OneField;
}

struct ThreeField {
    b: TwoField;
}

struct FourField {
    c: ThreeField;
}

contract DeepNestOnePer {
    value: FourField;
    
    init() {
        self.value = FourField{
            c: ThreeField{b: TwoField{a:OneField{x:42}}}
        };
    }
}