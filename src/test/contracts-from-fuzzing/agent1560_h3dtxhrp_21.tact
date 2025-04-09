struct S {
    a: Int?;
}

contract TestContract {
    inner: S = S{a:null};
    outer: S = S{a:null};
}