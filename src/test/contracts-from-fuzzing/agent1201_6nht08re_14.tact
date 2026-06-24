// contract parameters with many optional nested complex fields
contract OptParamNested(
    foo: ComplexType?,
    bar: ComplexType?
) {
}

struct ComplexType {
    num: Int;
    flag: Bool;
    text: String;
}
