struct Point {
    x: Int;
    y: Int;
}

struct Meta {
    name: String;
    desc: String?;
}

contract MultiStructFields {
    pos: Point = Point{ x: 5, y: 3 };
    info: Meta = Meta{ name: "hello", desc: null };
    score: Int = 42;
    flag: Bool = true;
    title: String = "test title";

    receive() {
        self.flag = !self.flag;
    }
}