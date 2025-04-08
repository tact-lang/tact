struct StructInner {
    x: Int;
    y: Int;
}

struct StructOuter {
    p: StructInner;
    q: StructInner;
}

contract MultiNestedStructTest {
    data: StructOuter;

    init() {
        self.data = StructOuter{
            p: StructInner{x:1,y:2},
            q: StructInner{x:3,y:4}
        };
    }
}