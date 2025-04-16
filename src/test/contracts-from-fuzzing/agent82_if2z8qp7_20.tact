struct X {
    val: Int;
}

struct Xopt {
    optx: X?;
}

contract Test {
    data: Xopt;

    init() {
        self.data = Xopt{
            optx: null
        };
    }
}