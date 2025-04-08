struct S10 { value: Int; }
struct S9 { x: S10; }
struct S8 { x: S9; }
struct S7 { x: S8; }
struct S6 { x: S7; }
struct S5 { x: S6; }
struct S4 { x: S5; }
struct S3 { x: S4; }
struct S2 { x: S3; }
struct S1 { x: S2; }

contract VeryDeep {
    data: S1;
    
    init() {
        self.data = S1{ x: S2{ x: S3{ x: S4{ x: S5{ x: S6{ x: S7{ x: S8{ x: S9{ x: S10{ value: 42 } } } } } } } } } };
    }
}