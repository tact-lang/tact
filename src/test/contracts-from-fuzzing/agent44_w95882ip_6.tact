struct InnerMost {
    flag: Bool;
}

struct Inner {
    n: Int;
    im: InnerMost?;
}

struct Outer {
    x: Int;
    y: Bool;
    inn: Inner?;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            x: 7,
            y: true,
            inn: null
        };
    }

    receive() {
        let x = self.val.x;
    }
}
