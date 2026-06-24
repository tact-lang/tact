// Contradictory minimal contract using nested Struct optional assigned a value
struct Inner {
    num: Int;
}

contract ContrOptional {
    val: Inner?;
    init() {
        self.val = Inner{ num: 42 };
    }
}