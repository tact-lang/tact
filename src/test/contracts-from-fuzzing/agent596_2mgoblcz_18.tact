struct ParamTest {
    x: Int;
}

contract ParamCtorTest(
    param: ParamTest,
) {
    // note: no init() allowed in param contracts, ensure nested param works
}