struct Layer3 {
    b3: Bool;
}

struct Layer2 {
    b2: Bool;
    next: Layer3;
}

struct Layer1 {
    b1: Bool;
    next: Layer2;
}

contract TestContract {
    field: Layer1;

    init() {
        self.field = Layer1{
            b1: false,
            next: Layer2{
                b2: true,
                next: Layer3{
                    b3: false
                }
            }
        };
    }
}