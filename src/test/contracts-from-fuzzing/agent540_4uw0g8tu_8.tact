struct X {
    a: Int = 0;
    b: Bool = false;
    c: Int?;
}

struct Y {
    s: X;
    d: Int;
}

contract DefaultsOptional {
    val: Y;

    init() {
        self.val = Y{
            s: X{ a: 5, b: true, c: null },
            d: 47
        };
    }
}