struct Inner { x: Int = 99; }

struct Mid { innerOpt: Inner?; }

contract TestChainOptional {
    midOpt: Mid?;

    init() {
        self.midOpt = Mid{innerOpt: Inner{x: 777}};
    }
}