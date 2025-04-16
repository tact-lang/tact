struct S {
    val: Int = 5;
    note: String? = null;
}

contract TestNestedStruct {
    s: S = S{};
    init() {}
}