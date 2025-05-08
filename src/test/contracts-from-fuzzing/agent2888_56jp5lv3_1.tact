struct Point {
    x: Int;
    y: Int;
}

struct Container {
    label: String;
    point: Point;
    extra: Bool?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            label: "test",
            point: Point{
                x: 5,
                y: 10,
            },
            extra: true,
        };
    }
}