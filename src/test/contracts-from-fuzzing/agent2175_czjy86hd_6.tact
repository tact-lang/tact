struct Point { x: Int; y: Int }

struct Container {
    p1: Point;
    p2: Point;
    optionalPoint: Point?;
}

contract MultipleNestedStructs {
    data: Container;
    
    init() {
        self.data = Container{
            p1: Point{ x: 1, y: 2 },
            p2: Point{ x: 3, y: 4 },
            optionalPoint: null
        };
    }
}