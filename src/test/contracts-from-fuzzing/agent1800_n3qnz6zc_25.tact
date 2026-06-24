struct Inner1 { a: Int; b: Bool; c: String; d: Address; e: Cell; }

struct Inner2 { x: Inner1; y: Int; }

contract NestedMultiType {
    val: Inner2;

    init() {
        self.val = Inner2{
            x: Inner1{ a: 1, b: true, c: "ok", d: myAddress(), e: emptyCell() },
            y: 42
        };
    }
}