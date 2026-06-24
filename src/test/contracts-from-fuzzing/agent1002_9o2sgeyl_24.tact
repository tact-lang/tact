struct TopLayer {
    inner1: Int;
    inner2: Int;
}

contract DefaultsAndAssign {
    val1: TopLayer = TopLayer{ inner1: 1, inner2: 2 };

    init() {
        self.val1 = TopLayer{ inner1: 3, inner2: 4 };
    }
}