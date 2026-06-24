struct BaseA {
    fa: Int;
}
struct BaseB {
    fb: Bool;
}
struct Compose {
    a: BaseA;
    b: BaseB;
}

contract Composition {
    data: Compose;

    init() {
        self.data = Compose{
            a: BaseA{ fa: 1 },
            b: BaseB{ fb: true }
        };
    }
}