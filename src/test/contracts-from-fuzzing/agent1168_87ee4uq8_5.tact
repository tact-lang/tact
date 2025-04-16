struct Tiny { one: Int; two: Bool; }

contract OptNestedOpt {
    val: Tiny?;

    init() {
        self.val = null;
    }
}