struct OptNested {
    a: Int?;
    b: Bool?;
    c: OptInner?;
}

struct OptInner {
    x: Int?;
    y: String?;
}

contract NestedOptionalsTest {
    data: OptNested;

    init() {
        self.data = OptNested{
            a: null,
            b: true,
            c: OptInner{x:null,y:"yes"}
        };
    }
}