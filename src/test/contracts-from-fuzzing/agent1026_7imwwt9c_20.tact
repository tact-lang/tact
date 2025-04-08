struct C2 {
    z: Int = 1;
}

struct C1 {
    inner: C2 = C2{};
}

contract TestContract {
    root: C1 = C1{};
}