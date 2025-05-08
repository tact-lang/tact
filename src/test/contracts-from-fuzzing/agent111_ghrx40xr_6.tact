struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Params {
    position: Point;
    label: String;
    flag: Bool;
    amount: Int as coins;
}

contract SerializeRanges {
    data: Params;
    init() {
        self.data = Params{
            position: Point{x:1, y:2},
            label: "A",
            flag: false,
            amount: ton("1")
        };
    }
}