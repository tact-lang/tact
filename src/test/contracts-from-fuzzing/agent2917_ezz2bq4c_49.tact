struct NestedMixOptionals {
    a: Int?;
    b: Inner1?;
}

struct Inner1 {
    x: Int?;
    y: Inner2?;
}

struct Inner2 {
    z: Int?;
}

contract MultiLayerMixOpt {
    f: NestedMixOptionals;

    init() {
        self.f = NestedMixOptionals{a: null, b: null};
    }
}
