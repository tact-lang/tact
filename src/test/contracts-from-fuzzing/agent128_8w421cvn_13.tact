struct Nested {
    z: Int = 5;
}

struct ComboOpt {
    n: Nested?;
}

contract TestContract {
    c: ComboOpt = ComboOpt{ n: null };
}