struct MultiBoolOpt {
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
}

contract ManyOptionalBools {
    m: MultiBoolOpt = MultiBoolOpt{
        b1: null,
        b2: null,
        b3: null,
    };

    receive() {}
}