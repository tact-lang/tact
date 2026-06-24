struct MixDeep {
    a: Int;
    b: Bool?;
    c: Nested?;
}

struct Nested {
    x: Int?;
    y: Bool;
}

contract TestContract {
    mix: MixDeep;

    init() {
        self.mix = MixDeep{
            a: 3,
            b: null,
            c: Nested{
                x: null,
                y: true,
            },
        };
    }
}