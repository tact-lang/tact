struct OneBigNest {
    l1: Layer1;
}

struct Layer1 {
    l2: Layer2;
}

struct Layer2 {
    l3: Layer3;
}

struct Layer3 {
    l4: Layer4;
}

struct Layer4 {
    i: Int;
    b: Bool;
    s: String;
}

contract OneBigNestTest {
    data: OneBigNest;
    init() {
        self.data = OneBigNest{
            l1: Layer1{
                l2: Layer2{
                    l3: Layer3{
                        l4: Layer4{ i:1, b:true, s:"hi" }
                    }
                }
            }
        };
    }
}