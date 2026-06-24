struct Point {
    x: Int;
    y: Int;
}

struct Container {
    nested: Point?;
    label: String;
}

contract TestContract {
    field: Container;

    init() {
        self.field = Container{
            nested: Point{ x: 10, y: 20 },
            label: "testing",
        };
    }
}