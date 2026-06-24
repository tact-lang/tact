struct Coord {
    x: Int as int64;
    y: Int as int64;
}

struct Data {
    flag: Bool;
    n: Int as uint16;
    coord: Coord;
    txt: String;
}

contract TestContract {
    content: Data;

    init() {
        self.content = Data{
            flag: true,
            n: 12345,
            coord: Coord{
                x: -5555,
                y: 4444
            },
            txt: "hello"
        };
    }

    receive() {}
}