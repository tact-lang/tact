struct SubData {
    x: Int;
    y: Int?;
}

contract ParamsTest(
    foo: Int,
    bar: SubData?,
) {
    receive() {
        // do nothing
    }
}