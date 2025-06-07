struct ManyBools {
    b1: Bool = false;
    b2: Bool = false;
    b3: Bool = false;
    b4: Bool = false;
    b5: Bool = false;
    b6: Bool = false;
    b7: Bool = false;
    b8: Bool = false;
}

contract TestContract {
    flags: ManyBools;

    init() {
        self.flags = ManyBools{};
    }
}
