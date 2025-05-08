// contract with nested optional STRUCT TYPE
struct OptionalNested {
    x: Int;
}

contract OptStruct {
    val: OptionalNested?;

    init() {
        self.val = null;
    }
}