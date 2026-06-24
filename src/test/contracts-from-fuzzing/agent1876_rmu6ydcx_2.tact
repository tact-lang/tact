struct DeepNested {
    inner: OptionLevel;
}

struct OptionLevel {
    val: Int?;
    flag: Bool?;
    point: Point;
}

struct Point {
    x: Int;
    y: Int;
}

contract DeepContract {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            inner: OptionLevel{
                val: 42,
                flag: true,
                point: Point{ x: 1, y: 2 }
            }
        };
    }
}