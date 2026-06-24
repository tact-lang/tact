struct Inner {
    b: Bool;
}

struct Outer1 {
    inn: Inner;
}

struct Outer2 {
    inn: Inner?;
}

contract DifferentNestings {
    a: Outer1;
    b: Outer2;
    
    init() {
        self.a = Outer1{inn: Inner{b:true}};
        self.b = Outer2{inn: null};
    }
}