struct NestedWithDefault {
    foo: Int = 17;
    bar: String = "abc";
}

contract DefaultParamTest(param: NestedWithDefault) {
}