struct Deep {
    n1: Int?;
    n2: Bool?;
    n3: Address?;
}

struct Middle {
    m1: Int;
    m2: Deep?;
}

contract DeepOptional {
    conf: Middle = Middle{
        m1: 1,
        m2: null,
    };

    receive() {}
}