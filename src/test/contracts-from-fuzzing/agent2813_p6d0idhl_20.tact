contract MultiStructFields {
    foo: Point;
    bar: Params;
    
    init() {
        self.foo = Point{x:1,y:2};
        self.bar = Params{name:"abc",point:self.foo};
    }
}

struct Point {
    x: Int;
    y: Int;
}

struct Params {
    name: String = "Satoshi";
    age: Int?;
    point: Point;
}
