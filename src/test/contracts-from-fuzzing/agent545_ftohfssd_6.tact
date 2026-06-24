struct Inner {
    x: Int;
    y: String?;
}

struct Middle {
    a: Inner;
    b: Inner;
    note: String;
}

struct Outer {
    mid1: Middle;
    mid2: Middle;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            mid1: Middle{
                a: Inner{ x: 1, y:null },
                b: Inner{ x: 2, y:null },
                note: "first",
            },
            mid2: Middle{
                a: Inner{ x: 3, y:null },
                b: Inner{ x: 4, y:null },
                note: "second",
            },
        };
    }

    receive() {}
}