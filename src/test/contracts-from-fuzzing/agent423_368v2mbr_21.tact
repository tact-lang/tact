struct Base {
    num: Int;
}

struct Wrapper {
    wrapped: Base;
}

contract WrapperField {
    f: Wrapper = Wrapper{ wrapped: Base{ num: 99 } };
}