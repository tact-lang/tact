struct Composite {
    a: Int;
    b: Bool?;
    s: Sub;
}

struct Sub {
    x: Int;
    y: Bool?;
}

contract CompositeCont {
    f: Composite;
    init() {
        self.f = Composite{
            a: 9,
            b: null,
            s: Sub{
                x: 10,
                y: true
            }
        };
    }
}