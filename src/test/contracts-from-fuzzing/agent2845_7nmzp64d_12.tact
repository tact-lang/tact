struct ChainA { x: Int }
struct ChainB { a: ChainA }
struct ChainC { b: ChainB }
struct ChainD { c: ChainC }
struct ChainE { d: ChainD }

struct Top {
    e: ChainE
}

contract VeryDeepNest {
    st: Top;

    init() {
        self.st = Top{
            e: ChainE{
                d: ChainD{
                    c: ChainC{
                        b: ChainB{
                            a: ChainA{
                                x: 555
                            }
                        }
                    }
                }
            }
        };
    }
}