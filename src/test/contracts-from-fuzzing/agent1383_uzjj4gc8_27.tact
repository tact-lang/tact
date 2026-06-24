struct NestedOpt {
    x: Int?;
}

contract NestedOptDefault {
    n: NestedOpt? = null;

    init() {
        self.n = NestedOpt{ x: 15 };
    }
}