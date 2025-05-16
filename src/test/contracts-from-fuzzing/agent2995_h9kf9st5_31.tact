struct Circle {
    center_x: Int as int64;
    center_y: Int as int64;
    radius: Int as uint32;
}

contract CircleStorage {
    c: Circle;

    init() {
        self.c = Circle{
            center_x: -100,
            center_y: -200,
            radius: 50
        };
    }
}