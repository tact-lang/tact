struct Inner { x: Int }
struct Outer { b: Inner }
contract Test {
    val: Outer?;
}