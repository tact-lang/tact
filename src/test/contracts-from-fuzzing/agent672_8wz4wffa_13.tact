struct Innermost { x: Int; }
struct Mid { inner: Innermost; }
struct OuterMost { mid: Mid; }

contract ChainNestedStructs {
    s: OuterMost;

    init() {
        self.s = OuterMost{ mid: Mid{ inner: Innermost{ x: 42 } } };
    }
}