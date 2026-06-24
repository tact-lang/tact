struct Point2 {
    x: Int;
    y: Int;
}

struct Container {
    p: Point2?;
}

contract NullableStructField {
    data: Container;

    init() {
        self.data = Container{p:null};
    }
}