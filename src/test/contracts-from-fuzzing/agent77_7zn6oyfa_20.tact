struct InnerMost {
 val: Int;
}

struct MidLayer {
 val: InnerMost;
}

struct OuterLayer {
 val: MidLayer;
}

contract AllNested {
    deep: OuterLayer;
    init() {
        self.deep = OuterLayer {
            val: MidLayer {
                val: InnerMost { val: 777 }
            }
        };
    }
}