struct Inner { x: Int }

struct Container {
    inner1: Inner;
    inner2: Inner;
    inner3: Inner;
    flag: Bool;
}

contract NestedStructs {
    data: Container = Container{
        inner1: Inner{ x: 1 },
        inner2: Inner{ x: 2 },
        inner3: Inner{ x: 3 },
        flag: true
    };
}