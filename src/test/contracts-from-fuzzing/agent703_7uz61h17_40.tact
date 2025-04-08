struct NestedMixed {
    x: Int?;
    y: Bool;
    z: String?;
}

contract ParamsComplex(
    foo: Int,
    nest: NestedMixed?
) {
    receive() {
        let _ = 1;
    }
}