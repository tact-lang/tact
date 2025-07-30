struct Point { x: Int; y: Int; }
struct Meta { label: String; pos: Point; }

contract ManyNested {
    first: Meta;
    second: Meta;

    init() {
        self.first = Meta{ label: "a", pos: Point{ x:1, y:2 } };
        self.second = Meta{ label: "b", pos: Point{ x:3, y:4 } };
    }
}
