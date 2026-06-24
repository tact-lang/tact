struct Layer3 {
    val: Int;
}

struct Layer2 {
    l3: Layer3;
}

struct Layer1 {
    l2: Layer2;
}

contract Nest4 {
    top: Layer1;

    init() {
        self.top = Layer1{
            l2: Layer2{
                l3: Layer3{ val: 77 }
            }
        };
    }
}
