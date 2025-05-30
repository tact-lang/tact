struct Wrap {
    maybe: Inner?;
}

struct Inner {
    n: Int;
    str: String?;
}

contract Test {
    data: Wrap;

    init() {
        self.data = Wrap{
            maybe: Inner{n:42, str:null}
        };
    }
}