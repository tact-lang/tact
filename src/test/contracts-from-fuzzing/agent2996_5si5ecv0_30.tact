struct CC {
    a: Int;
}

struct BB {
    cc: CC;
}

struct AA {
    bb: BB;
}

struct Root {
    aa: AA;
}

contract ChainWrap {
    data: Root;

    init() {
        self.data = Root{
            aa: AA{ bb: BB{ cc: CC{ a: 5 } } } 
        };
    }
}