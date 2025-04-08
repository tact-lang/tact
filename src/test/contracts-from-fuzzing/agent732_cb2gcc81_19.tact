struct ChainA {
    nested: ChainB;
}

struct ChainB {
    nested: ChainC;
}

struct ChainC {
    nested: ChainD;
}

struct ChainD {
    nested: ChainE;
}

struct ChainE {
    val: String;
}

contract ChainTest {
    all: ChainA;

    init() {
        self.all = ChainA{
            nested: ChainB{
                nested: ChainC{
                    nested: ChainD{
                        nested: ChainE{
                            val: "deep"
                        }
                    }
                }
            }
        };
    }
}