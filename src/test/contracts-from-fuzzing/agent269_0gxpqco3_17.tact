struct ChainA {
    a: Int = 1;
}
struct ChainB {
    b: ChainA? = null;
}
struct ChainC {
    c: ChainB? = null;
}

contract ChainOptional {
    x: ChainC? = null;

    init() {
        self.x = ChainC{ c: ChainB{ b: ChainA{ a: 5 } } };
    }
}