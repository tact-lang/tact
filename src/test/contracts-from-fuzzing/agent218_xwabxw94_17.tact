struct ManyBools {
    b1: Bool = true;
    b2: Bool = false;
    b3: Bool = true;
    b4: Bool = false;
    b5: Bool = true;
    b6: Bool = false;
    b7: Bool = true;
    b8: Bool = false;
}

contract PackedBools {
    mb: ManyBools;

    init() {
        self.mb = ManyBools{};
    }
}