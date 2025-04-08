struct Meta {
    description: String;
    valid: Bool;
}

struct Container {
    id: Int;
    meta: Meta?;
}

contract MixedTypesAndOptionals {
    c: Container;

    init() {
        self.c = Container{
            id: 5,
            meta: null,
        };
    }
}
