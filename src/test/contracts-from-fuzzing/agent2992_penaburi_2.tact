struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

contract StructInField {
    val: Inner;
    
    init() {
        self.val = Inner{ x: 1, y: false, z: "done" };
    }
}
