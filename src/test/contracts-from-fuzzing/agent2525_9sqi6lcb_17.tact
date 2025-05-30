// Combining structs with optional fields inside contract parameters

struct S1 {
    f1: Int?;
    f2: Bool;
}

struct S2 {
    nested: S1?;
}

contract TestContract(
    param: S2
) {}