struct ChainA { b: ChainB; }
struct ChainB { c: ChainC; }
struct ChainC { d: ChainD; }
struct ChainD { e: ChainE; }
struct ChainE { flag: Bool; }

contract ChainContract {
    payload: ChainA;

    init() {
        self.payload = ChainA{
            b: ChainB{
                c: ChainC{
                    d: ChainD{
                        e: ChainE{ flag: true }
                    }
                }
            }
        };
    }
}