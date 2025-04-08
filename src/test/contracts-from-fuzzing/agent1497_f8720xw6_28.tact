// Test optional nested in struct with nested default
struct Inner {
    optVal: Int?;
}

struct Outer {
    inner: Inner?;
    txt: String = "def";
}

contract TestContract {
    st: Outer = Outer{ inner:null };
}