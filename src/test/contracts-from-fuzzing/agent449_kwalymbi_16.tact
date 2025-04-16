struct N {
    a: Int;
    b: String?;
}

struct M {
    val: N?;
    f: Bool;
    another: Int?;
}

contract TestContract {
    mfield: M;

    init() {
        self.mfield = M{
            val: N{
                a: 3,
                b: null,
            },
            f: true,
            another: null,
        };
    }
}
