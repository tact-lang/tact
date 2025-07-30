struct Deep {
    n1: Int = 1;
    n2: Int = 2;
    nested: Inner;
}

struct Inner {
    x: Int?;                   
    y: String = "";
    ok: Bool = true;
}

contract DeepOptionals {
    state: Deep;

    init() {
        self.state = Deep{
            nested: Inner{},
        };
    }
}