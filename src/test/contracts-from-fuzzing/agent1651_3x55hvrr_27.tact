struct OneLevel {
    field: Int;
}

struct TwoLevel {
    child: OneLevel;
}

struct ThreeLevel {
    child: TwoLevel;
}

struct FourLevel {
    child: ThreeLevel;
}

contract Test27 {
    nested: FourLevel;

    init() {
        self.nested = FourLevel{ child: ThreeLevel{ child: TwoLevel{ child: OneLevel{ field: 42 } } } };
    }
}
