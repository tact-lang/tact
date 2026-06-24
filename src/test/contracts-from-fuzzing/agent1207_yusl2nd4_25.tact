struct Depth3 {
    depth2: Struct2;
}

struct Struct2 {
    depth1: Struct1;
}

struct Struct1 {
    base: Int;
}

contract ChainNested {
    root: Depth3;

    init() {
        self.root = Depth3{
            depth2: Struct2{
                depth1: Struct1{
                    base: 55
                }
            }
        };
    }
}