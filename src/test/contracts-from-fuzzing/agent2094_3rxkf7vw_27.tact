struct InnerStr {
    txt: String = "";
}

struct OuterStr {
    inner: InnerStr = InnerStr{};
}

contract EmptyString {
    data: OuterStr = OuterStr{};
    receive() {}
}
