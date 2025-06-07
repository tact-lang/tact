struct S {
    i: Int
}

contract DefaultedNested {
    inner: S = S{ i:42 };
}