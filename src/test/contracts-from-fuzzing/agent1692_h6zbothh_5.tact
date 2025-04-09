struct DeepInner {
    a: Int?;
    b: Bool;
    c: String?;
}

struct Middle {
    x: Int;
    y: DeepInner?;
}

struct OuterLayer {
    mainStr: String;
    container: Middle;
}

contract DeepNestingContract {
    info: OuterLayer;

    init() {
        self.info = OuterLayer{
            mainStr: "hi",
            container: Middle{
                x: 1,
                y: null
            }
        };
    }
}