// Large optional-covered nested struct with defaults inside
struct Inner {
    x: Int = 1;
    y: Bool?;
    z: String?;
}

struct Outer {
    inner: Inner?;
    name: String = "def";
}

contract TestContract {
    bigopt: Outer = Outer{ inner: null };
}