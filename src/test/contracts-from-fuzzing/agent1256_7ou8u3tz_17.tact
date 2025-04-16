struct Bottom {
    x: Int?;
    y: Bool? = false;
}

struct Middle {
    b: Bottom;
}

struct Upper {
    m: Middle;
}

contract DeepOptionMix {
    s: Upper;

    init() {
        self.s = Upper{ m: Middle{ b: Bottom{} } };
    }
}