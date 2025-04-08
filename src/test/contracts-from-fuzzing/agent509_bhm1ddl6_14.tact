struct SimpleInner { x: Int; y: Bool; }

contract OptionalTopStruct {
    val: SimpleInner?;

    init() {
        self.val = SimpleInner{ x: 100, y: true };
    }
}