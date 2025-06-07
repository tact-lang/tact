struct ChainA { b: ChainB; }
struct ChainB { c: ChainC; }
struct ChainC { d: ChainD; }
struct ChainD { e: ChainE; }
struct ChainE { f: ChainF; }
struct ChainF { g: ChainG; }
struct ChainG { h: ChainH; }
struct ChainH { i: Int; }

contract DeepChainTest {
    field: ChainA;

    init() {
        self.field = ChainA{
            b: ChainB{
                c: ChainC{
                    d: ChainD{
                        e: ChainE{
                            f: ChainF{
                                g: ChainG{
                                    h: ChainH{
                                        i: 999
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}