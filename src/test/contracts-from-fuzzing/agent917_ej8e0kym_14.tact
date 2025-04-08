struct Mid { val: Int; }

contract MultiNestedOpt {
    mid: Mid?;

    init() {
        self.mid = null;
    }
}