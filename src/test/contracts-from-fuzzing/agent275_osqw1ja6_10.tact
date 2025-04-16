struct Inner {
    a: Int;
}

contract TestContract(
    inner: Inner,
    opt_inner: Inner?,
    flag: Bool,
    txt: String,
) {}