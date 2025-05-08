struct ChainA {
    next: ChainB;
}
struct ChainB {
    next: ChainC;
}
struct ChainC {
    val: Int;
}

contract ChainContract {
    field: ChainA;
    init() {
        self.field = ChainA{
            next: ChainB{
                next: ChainC{
                    val: 1,
                },
            },
        };
    }
}
