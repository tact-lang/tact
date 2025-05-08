struct DeeplyNested {
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
    f: Int;
}

contract FourDeepNested {
    root: DeeplyNested;
    init() {
        self.root = DeeplyNested{
            l1: Layer1{
                l2: Layer2{
                    l3: Layer3{
                        l4: Layer4{
                            f: 69
                        }
                    }
                }
            }
        };
    }
}