struct DeepInit {
    inner1: InnerStruct;
    inner2: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    count: Int;
}

contract Test {
    state: DeepInit;

    init() {
        self.state = DeepInit{
            inner1: InnerStruct{ flag:true, count:1 },
            inner2: InnerStruct{ flag:false, count:2 },
        };
    }
}