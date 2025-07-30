struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    first: Int;
    second: Inner;
    third: Int;
}

contract TestNested {
    receive() {
        let o = Outer{
            first: 1,
            second: Inner{
                x: 2,
                y: 3
            },
            third: 4
        };
        let sum = o.first + o.second.x + o.second.y + o.third;
    }
}
