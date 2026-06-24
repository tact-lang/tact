struct ChainA {
    next: ChainB?;
    a: Int;
}

struct ChainB {
    next: ChainC?;
    b: Int;
}

struct ChainC {
    c: Int;
}

contract Test {
    data: ChainA = ChainA{
        next: ChainB{
            next: null,
            b:2
        },
        a:1
    };

    receive() {}
}