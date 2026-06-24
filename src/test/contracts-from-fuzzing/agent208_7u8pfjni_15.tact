struct Rec1 {
    next: Rec2;  
    num1: Int; 
}

struct Rec2 {
    next: Rec3;
    num2: Int;
}

struct Rec3 {
    val: Int;
}

contract Test16 {
    r: Rec1;
    init() {
        self.r = Rec1{
            next: Rec2{
                next: Rec3{val: 50},
                num2: 20,
            },
            num1: 10,
        };
    }
}