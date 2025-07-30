struct Deep {
    a: Int;
    b: Bool;
}

struct Wrapper {
    inner: Deep;
    c: Bool;
}

contract DeeplyNested {
    data: Wrapper;

    init() {
        self.data = Wrapper{inner: Deep{a: 10, b: false}, c: true};
    }
}