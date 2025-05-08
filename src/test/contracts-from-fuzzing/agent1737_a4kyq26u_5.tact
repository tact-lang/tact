struct InnerMost {
    a: Int?;
    b: Bool = true;
}

struct Middle {
    x: Int?;
    y: InnerMost?;
}

contract DeepOptionals {
    data: Middle = Middle{
        x: null,
        y: null
    };
}