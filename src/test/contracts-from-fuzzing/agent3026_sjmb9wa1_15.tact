struct S1 {
    a: Int;
}

contract InitViaDefault {
    s: S1 = S1{a: 42};
}