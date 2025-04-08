struct DeepMix {
    a: Int?;
    b: Bool;
    c: InnerDeep;
}

struct InnerDeep {
    foo: Int?;
    bar: Bool?;
}

contract PersistenceTest {
    val: DeepMix;

    init() {
        self.val = DeepMix{
            a: null,
            b: true,
            c: InnerDeep{
                foo: null,
                bar: null,
            },
        };
    }
}
