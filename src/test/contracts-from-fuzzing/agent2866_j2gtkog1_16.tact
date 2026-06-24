struct Deep {
    s: Shallow;
}

struct Shallow {
    flag: Bool;
}

contract OptionalDeep {
    d: Deep?;

    init() {
        self.d = null;
    }

    receive() {}
}