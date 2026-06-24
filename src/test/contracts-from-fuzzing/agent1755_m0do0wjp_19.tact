struct Deep {
    a: Int;
    b: Int? = null;
}

struct Wrap {
    d: Deep;
    optD: Deep? = null;
    s: String = "abc";
    optS: String? = null;
}

contract ParamTest(
    state: Wrap,
) {}
