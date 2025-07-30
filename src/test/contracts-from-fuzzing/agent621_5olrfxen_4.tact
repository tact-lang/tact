struct Inner { val: Int; }
struct Outer { inside: Inner?; }

contract OptionalInnerInStruct {
    field: Outer;
    init() {
        self.field = Outer{ inside: null };
    }
}