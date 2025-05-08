struct InnerOpt {
    val: Int?;
}

struct InnerDef {
    val: Bool;
}

struct Container {
    maybe: InnerOpt?;
    fixed: InnerDef;
}

contract MixOptAndFixed {
    bundle: Container;

    init() {
        self.bundle = Container{
            maybe: null,
            fixed: InnerDef{val: true}
        };
    }
}