// nested optional struct with some defaults
struct Bottom {
    x: Int?;
}

struct Mid {
    b: Bottom?;
    y: Bool = false;
}

struct Top {
    inner: Mid?;
    msg: String?;
}

contract OptDefaultsNest {
    state: Top;

    init() {
        self.state = Top{
            inner: null,
            msg: null
        };
    }
}