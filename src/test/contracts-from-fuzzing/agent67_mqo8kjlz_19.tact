struct Middle {
    a: Int;
    b: Int;
}

struct Outer {
    first: Middle;
    second: Middle;
    third: Middle;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            first: Middle{a:1,b:2},
            second: Middle{a:3,b:4},
            third: Middle{a:5,b:6}
        };
    }
}