struct Point { x: Int; y: Int; }

struct Meta {
    label: String;
    value: Int?;
}

struct Container {
    point: Point;
    meta: Meta;
}

contract TestContract {
    c: Container;

    init() {
        self.c = Container{
            point: Point{ x:1, y:2 },
            meta: Meta{ label:"test", value:null }
        };
    }
}
