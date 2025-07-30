struct Inner { x: Int = 1; }
struct Outer { inner: Inner? = null; }

contract NestedOptionalStruct { outer: Outer = Outer{ inner: null }; }