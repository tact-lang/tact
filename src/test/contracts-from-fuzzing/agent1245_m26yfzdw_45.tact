struct ChainStruct {
    foo: Int?;
    bar: ChainSub?;
}

struct ChainSub {
    x: Int?;
    y: Bool?;
}

contract ChainPersist {
    v: ChainStruct;

    init() {
        self.v = ChainStruct{
            foo: null,
            bar: ChainSub{
                x: null,
                y: true
            }
        };
    }
}
