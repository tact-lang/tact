struct WrapLeaf {
    leaf: Int;
}

struct WrapMid {
    mid: WrapLeaf;
}

struct WrapTop {
    top: WrapMid;
}

contract FullChain {
    data: WrapTop;

    init() {
        self.data = WrapTop{
            top: WrapMid{
                mid: WrapLeaf{
                    leaf: 999
                }
            }
        };
    }
}