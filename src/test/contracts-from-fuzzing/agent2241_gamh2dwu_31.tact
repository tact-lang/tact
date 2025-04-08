struct ManyBools {
    a: Bool = true;
    b: Bool = false;
    c: Bool = true;
    d: Bool = false;
    e: Bool = true;
    f: Bool = false;
}

contract LotsOfBools {
    x: ManyBools;

    init() {
        self.x = ManyBools{};
    }
}