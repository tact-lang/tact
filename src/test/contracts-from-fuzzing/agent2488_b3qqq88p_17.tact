struct Base {
    x: Int;
    y: Int = 9;
}

struct Middle {
    base: Base?;
    flag: Bool;
}

struct Container {
    mid: Middle?;
    label: String = "hi";
}

contract ChainTest {
    root: Container;

    init() {
        self.root = Container{
            mid: null
            // label omitted
        };
    }
}