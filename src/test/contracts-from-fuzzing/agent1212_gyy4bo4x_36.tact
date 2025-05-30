struct ChainStruct1 {
    a: Int;
}

struct ChainStruct2 {
    s: ChainStruct1;
}

struct ChainStruct3 {
    t: ChainStruct2;
}

contract DeepChain {
    deep: ChainStruct3;

    init() {
        self.deep = ChainStruct3{
            t: ChainStruct2{
                s: ChainStruct1{
                    a: 555
                }
            }
        };
    }
}