struct Inner {
    f: Int?;
}

struct Outer {
    g: Inner?;
}

contract MultiOpt {
    data: Outer;

    init() {
        self.data = Outer{ g: null };
    }
}