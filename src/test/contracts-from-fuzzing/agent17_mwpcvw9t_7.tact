struct A {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell?;
    f5: Address?;
    f6: String;
    f7: Bool;
}

contract DiverseFields {
    val: A = A{f1: 1, f2: true, f3: "x", f4: null, f5: null, f6: "y", f7: false};
}