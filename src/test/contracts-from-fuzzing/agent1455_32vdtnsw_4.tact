struct Inner {
    s: String = "";
}

contract TestContract {
    str1: String = "a";
    str2: String = "b";
    sfield: Inner = Inner{};
    str3: String = "c";
    init() {}
}
