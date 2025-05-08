struct S {
    a: Int = 1;
    b: Bool = true;
    c: Address;
}

contract TestContract {
    sOpt: S? = null;
    init() {}
    receive() {}
}