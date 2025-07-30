struct ChainA {
    next: ChainB;
}
struct ChainB {
    next: ChainC;
}
struct ChainC {
    next: ChainD;
}
struct ChainD {
    val: Int?;
}
contract OptionalDeep {
    root: ChainA;

    init() {
        self.root = ChainA{
            next: ChainB{
                next: ChainC{
                    next: ChainD{ val: null }
                }
            }
        };
    }
}