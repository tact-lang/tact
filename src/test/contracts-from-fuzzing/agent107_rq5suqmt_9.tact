struct Middle {
    x: Int;
    y: Bool;
}

struct Container {
    first: Middle;
    second: Middle;
    third: Middle;
}

contract RepeatedStructsTest {
    c: Container;
    init() {
        self.c = Container{
            first: Middle{ x: 1, y: true },
            second: Middle{ x: 2, y: false },
            third: Middle{ x: 3, y: true }
        };
    }
}