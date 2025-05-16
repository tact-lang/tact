struct Layer3 {
    val: Int;
}

struct Layer2 {
    next: Layer3;
}

struct Layer1 {
    next: Layer2;
}

contract ChainNesting {
    data: Layer1;
    init() {
        self.data = Layer1{
            next: Layer2{
                next: Layer3{
                    val: 777
                }
            }
        };
    }
}