struct Coords {
    x: Int as int64;
    y: Int as int64;
    flag: Bool;
}

struct Container {
    count: Int as uint8;
    coords: Coords?;
    label: String;
}

contract Test {
    state: Container;

    init() {
        self.state = Container{
            count: 10,
            coords: null,
            label: "ok"
        };
    }
}