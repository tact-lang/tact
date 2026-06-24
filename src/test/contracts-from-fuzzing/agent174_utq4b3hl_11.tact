struct Point { x: Int; y: Int; }
struct Meta {
    label: String;
    description: String?;
}

struct RichData {
    id: Int;
    pos: Point;
    meta: Meta;
}

contract CompositeFields {
    rd: RichData;

    init() {
        self.rd = RichData{
            id: 1,
            pos: Point{ x:10, y:20 },
            meta: Meta{ label: "test", description: null }
        };
    }
}