struct PersistData {
    foo: Int;
    bar: Bool?;
}

contract ParamComplex(
    data: PersistData
) {
    receive() {}
}