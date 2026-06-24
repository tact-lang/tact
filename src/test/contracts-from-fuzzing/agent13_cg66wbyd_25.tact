struct Point { x: Int; y: Int; }

struct Params {
    id: Int;
    label: String;
    location: Point;
    flag: Bool;
    info: String?;
}

contract Test {
    params: Params;

    init() {
        self.params = Params{
            id: 1,
            label: "hello",
            location: Point{ x: 10, y: 20 },
            flag: true,
            info: null
        };
    }
}
