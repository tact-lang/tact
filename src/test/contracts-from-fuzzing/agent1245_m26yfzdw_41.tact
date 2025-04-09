struct DeepA {
    foo: Int;
    bar: DeepB;
}

struct DeepB {
    baz: Int;
    qux: Bool;
    extra: DeepC;
}

struct DeepC {
    flag: Bool;
    val: Int;
}

contract MultiLevel {
    v: DeepA;

    init() {
        self.v = DeepA{
            foo: 1,
            bar: DeepB{
                baz: 2,
                qux: false,
                extra: DeepC{
                    flag: true,
                    val: 3
                }
            }
        };
    }
}
