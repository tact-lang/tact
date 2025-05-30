struct InnerOpt {
    foo: Int? = 77;
    bar: Bool?;
}

contract ParamNesting(
    data: InnerOpt?
) {
    receive() {}
}