struct BoolChain4 {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
}

struct WrappedBoolChain {
    chain: BoolChain4;
}

contract TestStorage {
    data: WrappedBoolChain;

    init() {
        self.data = WrappedBoolChain{
            chain: BoolChain4{
                b1:true,
                b2:false,
                b3:true,
                b4:false
            }
        };
    }
}