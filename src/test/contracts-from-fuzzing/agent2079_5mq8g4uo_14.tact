struct P1 { 
    s: String; 
}

struct P2 {
    s: String; 
    optionalP1: P1?;
}

struct P3 {
    p2: P2;
}

contract TestContract {
    root: P3;
    init() {
        self.root = P3{
            p2: P2{s:"hi", optionalP1: P1{s:"test"}}
        };
    }
}