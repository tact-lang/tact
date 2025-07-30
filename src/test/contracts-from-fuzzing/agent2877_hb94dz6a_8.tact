struct X {
    a: Int;
    b: Bool;
}

struct Y {
    m: X?;
    s: String?;
}

contract NestedOptional {
    data: Y;

    init() {
        self.data = Y{
            m: null,
            s: null,
        };
    }
}