struct ContainerOne {
    a: Int;
}

struct ContainerTwo {
    b: Int;
    c: ContainerOne;
}

contract FlatNestedTest {
    x: Int;
    y: ContainerTwo;

    init() {
        self.x = 99;
        self.y = ContainerTwo{b: 100, c: ContainerOne{a: 101}};
    }
}