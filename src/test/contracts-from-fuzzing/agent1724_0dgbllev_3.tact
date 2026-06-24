struct DeepNest3 {
    x: Int;
}

struct DeepNest2 {
    middle: DeepNest3;
}

struct DeepNest1 {
    top: DeepNest2;
}

contract TestDeep {
    root: DeepNest1;

    init() {
        self.root = DeepNest1{
            top: DeepNest2{
                middle: DeepNest3{
                    x: 7
                }
            }
        };
    }
}