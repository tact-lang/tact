struct Point { x: Int; y: Int; }

struct Shape {
    main: Point?;
    alt: Point;
}

struct Container {
    shape: Shape;
    altShape: Shape?;
}

contract DeepNestedStructs {
    c: Container;

    init() {
        self.c = Container{
            shape: Shape{ main: null, alt: Point{ x: 1, y: 2 } },
            altShape: null
        };
    }
}