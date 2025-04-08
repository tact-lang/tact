struct Layer3 { v: Int }

struct Layer2 {
    l1: Layer3;
    l2: Layer3;
}

struct Layer1 {
    m1: Layer2;
    m2: Layer2;
}

contract FuzzTest {
    state: Layer1;

    init() {
        self.state = Layer1{
            m1: Layer2{ l1: Layer3{v:1}, l2: Layer3{v:2} },
            m2: Layer2{ l1: Layer3{v:3}, l2: Layer3{v:4} }
        };
    }
}
