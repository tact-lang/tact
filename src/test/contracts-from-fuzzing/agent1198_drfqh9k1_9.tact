struct Inner {
    a: Int;
    b: String?;
}

struct Outer {
    first: Inner?;
    second: Bool;
    third: Inner?;
}

contract OptNested {
    data: Outer;

    init() {
        self.data = Outer{
            first: null,
            second: true,
            third: Inner{
                a: 5,
                b: null
            }
        };
    }

    receive() {
        self.data = self.data;
    }
}