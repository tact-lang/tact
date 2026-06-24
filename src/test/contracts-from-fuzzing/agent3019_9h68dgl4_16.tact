struct UnionA {
    val: Int = 1;
}

struct UnionB {
    val: Int = 2;
}

struct Top {
    a: UnionA?;
    b: UnionB?;
}

contract TestContract {
    top: Top = Top{};
}