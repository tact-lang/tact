struct DeeplyNested {
    val1: Int;
    val2: String;
}

struct Middle1 {
    x: DeeplyNested;
}

struct Middle2 {
    y: Middle1;
}

struct Outer {
    z: Middle2;
}

contract MultiLayerContract {
    content: Outer;

    init() {
        self.content = Outer{
            z: Middle2{
                y: Middle1{
                    x: DeeplyNested{ val1: 7, val2: "deep" }
                }
            }
        };
    }
}
