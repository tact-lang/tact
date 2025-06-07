struct Sm {
    a: Int;
    b: Bool;
}

struct Md {
    sm1: Sm;
    sm2: Sm;
}

struct Lg {
    md1: Md;
    md2: Md;
}

contract WideDeepMixTest {
    data: Lg;

    init() {
        self.data = Lg{
            md1: Md{
                sm1: Sm { a: 1, b: true },
                sm2: Sm { a: 2, b: false },
            },
            md2: Md{
                sm1: Sm { a: 3, b: false },
                sm2: Sm { a: 4, b: true },
            },
        };
    }
}