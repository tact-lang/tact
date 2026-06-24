struct Point {
    x: Int;
    y: Int;
}

struct Container {
    data: Point;
    flag: Bool?;
}

contract NestedStructContract {
    cont: Container;
    
    init() {
        self.cont = Container{
            data: Point{x: 1, y: 2},
            flag: true,
        };
    }
}