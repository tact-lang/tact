struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: String;
}

struct Combined {
    f1: Inner1;
    f2: Inner2;
    opt: Inner1?;
}

contract MultipleStructs {
    combo: Combined;

    init() {
        self.combo = Combined{
            f1: Inner1{a:1},
            f2: Inner2{b:"b"},
            opt: null,
        };
    }
}