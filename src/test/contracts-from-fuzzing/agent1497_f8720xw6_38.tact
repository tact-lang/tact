// Nested struct with optional containing optional inner
struct Inner {
    v: Int?;
}
struct Outer {
    i: Inner?;
}
contract TestContract {
    oo: Outer = Outer{ i: null };
}