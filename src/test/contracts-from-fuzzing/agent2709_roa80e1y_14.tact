struct Small {
    a: Int;
}

contract ParamsVsInit(
    foo: Int,
    bar: Small,
) {
    // This usage should be valid, contract parameter with nested struct
}