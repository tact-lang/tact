struct Sub {
    x: Int;
    y: Int;
}

struct Wrap {
    a: Sub;
    b: Sub;
}

contract TestContract {
    val: Wrap;

    init() {
        self.val = Wrap{
            a: Sub{ x: 1, y: 2 },
            b: Sub{ x: 3, y: 4 }
        };
    }
}
