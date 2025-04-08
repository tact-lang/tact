struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Params {
    amount: Int as coins;
    flag: Bool;
    note: String;
    pt: Point;
}

contract TestContract {
    params: Params;

    init() {
        self.params = Params{
            amount: 1000000,
            flag: true,
            note: "hi",
            pt: Point{x: 42, y: -42}
        };
    }
}
