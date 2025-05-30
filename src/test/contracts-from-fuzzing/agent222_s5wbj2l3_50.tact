struct OutS {
    inner: InS;
}

struct InS {
    x: Int;
}

contract DefaultsAndInit {
    f: OutS = OutS{ inner: InS{ x: 2 } };

    init() {
        self.f = OutS{ inner: InS{ x: 7 } };
    }
}