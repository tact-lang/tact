struct Inner {
    x: Int?;
    y: Bool? = true;
}

struct Outer {
    child: Inner;
}

contract OptDefaults {
    data: Outer;

    init() {
        self.data = Outer{
            child: Inner{x: null, y: true}
        };
    }
}