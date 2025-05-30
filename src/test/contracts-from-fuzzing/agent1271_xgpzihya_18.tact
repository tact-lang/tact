struct InnerData {
    foo: Int;
    bar: Bool;
}

contract OptParam(
    thing: InnerData?,
    id: Int,
    label: String,
) {
    receive() {}
}