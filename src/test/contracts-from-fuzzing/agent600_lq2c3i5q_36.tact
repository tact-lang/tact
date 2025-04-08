// struct default for nested optional WITH serialization
struct NestedOptSer {
    val: Int? as uint32 = null;
}

contract StructDefNestedOpt {
    x: NestedOptSer;
    init() {
        self.x = NestedOptSer{}; // relies on default
    }
}