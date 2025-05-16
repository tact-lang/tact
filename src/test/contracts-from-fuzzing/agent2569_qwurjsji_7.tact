struct Inner { val: Int?; }
struct Outer { inner: Inner; }

contract DeepDefault {
    field: Outer = Outer{ inner: Inner{} };
}