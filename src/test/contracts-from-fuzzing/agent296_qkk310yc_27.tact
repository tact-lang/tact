struct ChainA {
    val: Int;
}

struct ChainB {
    nested: ChainA;
}

struct ChainC {
    nested: ChainB;
}

contract DeepDefaults {
    chain: ChainC = ChainC{
        nested: ChainB{
            nested: ChainA{
                val: 999
            }
        }
    };
}