struct Bottom {
    s: String;
    b: Bool;
}

struct Middle {
    val: Bottom;
}

struct OuterMost {
    m: Middle;
}

contract EdgeCase {
    outer: OuterMost;

    init() {
        self.outer = OuterMost{
            m: Middle{
                val: Bottom{
                    s: "edge",
                    b: true
                }
            }
        };
    }
}