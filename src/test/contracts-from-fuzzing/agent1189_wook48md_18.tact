struct Inner { val: Int = 42; }
struct Outer { inner: Inner; }

contract ImplicitDefaultNested { s: Outer = Outer{ inner: Inner{} }; }