struct OptionalChain {
   lvl2: OptionalMiddle?;
}

struct OptionalMiddle {
   leaf: OptionalLeaf?;
}

struct OptionalLeaf {
   x: Int?;
}

contract DeepOptionalChain {
    chain: OptionalChain = OptionalChain{lvl2:null};

    init() {
        self.chain = OptionalChain{lvl2:OptionalMiddle{leaf:null}};
    }

    receive() {
        let _ = self.chain;
    }
}