struct ManyLayer1 {
    v: Int;
}
struct ManyLayer2 {
    s: ManyLayer1;
}
struct ManyLayer3 {
    s: ManyLayer2;
}
struct ManyLayer4 {
    s: ManyLayer3;
}

contract FourDeepNested {
    d: ManyLayer4;

    init() {
        self.d = ManyLayer4{ s: ManyLayer3{ s: ManyLayer2{ s: ManyLayer1{ v: 100 } } } };
    }
}
