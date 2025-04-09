struct Comb {
    a: Int;
    b: Bool;
    c: String?;
}

contract CombineAll {
    v: Comb;

    init() {
        self.v = Comb{
            a: 42,
            b: true,
            c: null
        };
    }
}