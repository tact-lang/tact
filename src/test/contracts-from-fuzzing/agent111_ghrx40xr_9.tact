// contract with deeply nested optional struct fields 
struct Z {
    q: Int;
}

struct Y {
    z: Z?;
}

struct X {
    y: Y?;
}

contract DeepOptionals {
    data: X?;
    init() {
        self.data = X{ y: Y{z: Z{q:42}} };
    }
}