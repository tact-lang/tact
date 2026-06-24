struct X {
    a: Int;
}

struct Y {
    val: X?;
}

struct Z {
    box: Y?;
}

contract OptOptChainTest {
    data: Z;

    init() {
        self.data = Z{box: null};
    }
}