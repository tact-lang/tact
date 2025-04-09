struct Info {
    note: String? = "abc";
}

contract NestedOptDefault {
    info: Info = Info{};
}