struct Bottom {
    z: Int;
}

struct Middle {
    b: Bottom?;
}

struct Top {
    m: Middle?;
}

contract Test {
    chain: Top = Top{m: null};
}