struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct WithOpt {
    id: Int;
    point: Point?;
}

contract OptStructField {
    data: WithOpt;
    init() {
        self.data = WithOpt{
            id: 99,
            point: null
        };
    }
}