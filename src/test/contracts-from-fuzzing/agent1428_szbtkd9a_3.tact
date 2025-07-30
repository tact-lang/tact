struct DeeplyNested {
    inner: Middle?;
}

struct Middle {
    foo: Base;
    bar: Base?;
}

struct Base {
    num: Int;
    flag: Bool;
}

contract TestContract {
    store: DeeplyNested;

    init() {
        self.store = DeeplyNested{
            inner: Middle{
                foo: Base{ num: 1, flag: true },
                bar: null
            }
        };
    }
}