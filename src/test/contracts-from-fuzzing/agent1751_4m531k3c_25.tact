struct Sub {
    x: Int;
    y: Bool?;
}

struct Sup {
    sub: Sub;
    txt: String?;
}

contract ParamPersist(
    data: Sup
) {
    receive() {}
}