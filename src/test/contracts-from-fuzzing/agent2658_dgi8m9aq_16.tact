struct Compose {
    x: Int;
    y: Int;
}

struct Container {
    a: Compose;
    b: Compose;
}

contract SameStructTwice {
    data: Container = Container{
        a: Compose{ x: 1, y: 2 },
        b: Compose{ x: 3, y: 4 }
    };
}