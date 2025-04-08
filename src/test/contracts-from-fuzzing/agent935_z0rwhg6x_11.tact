struct Point {
    x: Int;
    y: Int;
}

struct Params {
    name: String = "default";
    age: Int?;
    location: Point;
}

contract TestContract {
    params: Params;

    init() {
        self.params = Params{
            location: Point{ x: 4, y: 2 }
        };
    }
}