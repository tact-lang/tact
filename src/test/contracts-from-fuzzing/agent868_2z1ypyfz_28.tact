struct MidOpt {
    a: Int?;
    b: Int;
    c: Bool?;
}

struct Wrap {
    inner: MidOpt;
}

contract WrapOpt {
    data: Wrap = Wrap{ inner: MidOpt{ a: null, b:5, c:true } };
}