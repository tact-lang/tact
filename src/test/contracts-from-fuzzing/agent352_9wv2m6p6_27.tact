struct OptNested {
    sub: Sub?;
}

struct Sub {
    val: Int;
}

contract Test {
    data: OptNested;

    init() {
        self.data = OptNested{
            sub: null
        };
    }
}