struct InnerOpt {
    foo: Int?;
    bar: Bool?;
}

struct OuterMixOpt {
    x: Int?;
    y: Bool;
    z: InnerOpt?;
}

contract MixedOptionals {
    store: OuterMixOpt;

    init() {
        self.store = OuterMixOpt{
            x: null,
            y: true,
            z: null
        };
    }
}