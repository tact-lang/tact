trait T {
    myVar: Int;
}

contract ParamsAndTrait(
    myVar: Int
) with T {
    receive() {}
}