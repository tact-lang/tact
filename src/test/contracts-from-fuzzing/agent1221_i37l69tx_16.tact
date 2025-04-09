struct ChainA { val: Int }
struct ChainB { a: ChainA }
struct ChainC { b: ChainB }
struct ChainD { c: ChainC }
struct ChainE { d: ChainD }
struct ChainF { e: ChainE }
struct ChainG { f: ChainF }
struct ChainH { g: ChainG }

contract SuperDeep {
    store: ChainH;

    init() {
        self.store = ChainH{
            g: ChainG{
                f: ChainF{
                    e: ChainE{
                        d: ChainD{
                            c: ChainC{
                                b: ChainB{
                                    a: ChainA{
                                        val: 12345
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