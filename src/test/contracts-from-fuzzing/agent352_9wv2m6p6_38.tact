struct OptNested {
    sub: Sub?;
}

struct Sub {
    f: Int?;
}

contract Test {
    val: OptNested;

    init() {
        self.val = OptNested{
            sub: Sub{f:null}
        };
    }
}