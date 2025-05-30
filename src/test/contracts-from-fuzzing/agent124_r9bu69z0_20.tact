struct AA {
    x: Int;
}
struct BB {
    y: Int;
    a: AA;
}
struct CC {
    z: Int;
    b: BB;
}
contract DeepMixed {
    f: CC;
    init() {
        self.f = CC{ z: 1, b: BB{ y:2, a: AA{ x:3 } } };
    }
}