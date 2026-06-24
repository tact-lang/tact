struct Simple { x: Int; }

contract Test {
    value: Simple;

    init() {
        self.value = Simple{ x: 1 };
    }
}