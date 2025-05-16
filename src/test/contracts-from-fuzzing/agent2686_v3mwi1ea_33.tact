struct InnerMost { x: Int; }
struct MidNest { inner: InnerMost; flag: Bool; }
struct TopNest { mid: MidNest; txt: String?; }

contract MultiNest {
    val: TopNest;

    init() {
        self.val = TopNest{
            mid: MidNest{
                inner: InnerMost{ x: 42 },
                flag: true
            },
            txt: "hi"
        };
    }
}
