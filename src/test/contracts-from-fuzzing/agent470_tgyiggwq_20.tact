struct Outermost {
    a: Int?;
    b: Middle?;
}

struct Middle {
    c: Inner?;
}

struct Inner {
    x: Int?;
}

contract TangleOpt {
    tangled: Outermost;
    init() {
        self.tangled = Outermost{
            a: null,
            b: Middle{
                c: Inner{ x: null }
            }
        };
    }
}