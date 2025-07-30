struct A1 { x: Int }
struct A2 { x: A1 }
struct A3 { x: A2 }
struct A4 { x: A3 }
struct A5 { x: A4 }
struct A6 { x: A5 }
struct A7 { x: A6 }
struct A8 { x: A7 }

contract VeryDeep {
    f: A8;
    
    init() {
        self.f = A8{ x: A7{ x: A6{ x: A5{ x: A4{ x: A3{ x: A2{ x: A1{ x:42 } } } } } } } };
    }
}