struct DefaultsInParams {
    a: Int = 1;
    b: Bool = true;
}

contract ParamTest(
    foo: DefaultsInParams
) {
    receive() {}
}