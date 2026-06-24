struct InnerMost {
    q: String;
}

struct Middle {
    p: InnerMost;
}

struct OuterMost {
    o: Middle;
}

contract DeepNest {
    val: OuterMost;
    init() {
        self.val = OuterMost{ o: Middle{ p: InnerMost{ q: "deep" } } };
    }
    receive() {}
}