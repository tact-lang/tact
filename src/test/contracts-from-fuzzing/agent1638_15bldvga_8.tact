struct Inner { f: Int = 1 }
struct Outer { inner: Inner = Inner{} }

contract NestedDefaults {
    val: Outer = Outer{};
}