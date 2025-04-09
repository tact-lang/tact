// optional inside nested struct inside param
struct Inner {
    v: Int?;
}

contract ParamComplex(
    i: Inner?,
    s: String?,
    b: Bool,
) {
    receive() {
        let _ = self.b;
    }
}