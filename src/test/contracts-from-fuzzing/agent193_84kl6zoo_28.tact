struct InnerMost { val: String; }
struct MidNest { inner: InnerMost; }
struct TopNest { mid: MidNest; }

contract DeepStringNest {
    all: TopNest;

    init() {
        self.all = TopNest{ mid: MidNest{ inner: InnerMost{ val: "hooray" } } };
    }
}