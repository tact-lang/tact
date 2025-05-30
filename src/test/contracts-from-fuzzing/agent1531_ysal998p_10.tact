struct Layer1 {
    f1: Int;
    f2: Layer2;
}

struct Layer2 {
    f3: Int;
    f4: Layer3;
}

struct Layer3 {
    f5: Int;
    f6: Layer4;
}

struct Layer4 {
    f7: Int;
}

contract DeepTest {
    val: Layer1;

    init() {
        self.val = Layer1{
            f1:1,
            f2: Layer2{
                f3:2,
                f4: Layer3{
                    f5:3,
                    f6: Layer4{
                        f7:4,
                    }
                }
            }
        };
    }
}
