struct Sub {
    foo: Int = 10;
    bar: Bool = false;
}

contract DefaultStructLiteral {
    s: Sub = Sub{};
}
