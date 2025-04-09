struct Inner { y: Int }
struct Outer { x: Inner? }
contract OptionalNestedStruct {
    s: Outer = Outer{ x: null };
}