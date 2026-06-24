struct InnerMost {
    a: Int;
    b: Bool;
    c: String;
}

struct Middle {
    inner: InnerMost;
    x: String;
}

struct Outer {
    mid: Middle;
    y: Bool;
}

contract ThreeLayerNested {
    nest: Outer;

    init() {
        self.nest = Outer{
            mid: Middle{
                inner: InnerMost{ a:12, b:true, c:"innermost" },
                x: "middle"
            },
            y: false
        };
    }
}