struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct DataHolder {
    a: Int as uint32;
    b: Bool;
    c: String;
    d: Point;
}

contract SerializeSpec {
    val: DataHolder;

    init() {
        self.val = DataHolder{
            a: 123,
            b: true,
            c: "h",
            d: Point{ x: 5, y: 6 }
        };
    }
}