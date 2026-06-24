struct Layer1 {
    nest: Layer2;
}
struct Layer2 {
    nest: Layer3;
}
struct Layer3 {
    nest1: Leaf;
    nest2: Leaf;
}
struct Leaf {
    v: Int;
}

contract TreeTest {
    root: Layer1;

    init() {
        self.root = Layer1{
            nest: Layer2{
                nest: Layer3{
                    nest1: Leaf{v:1},
                    nest2: Leaf{v:2}
                }
            }
        };
    }
}