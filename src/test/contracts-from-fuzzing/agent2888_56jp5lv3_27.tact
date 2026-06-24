// contract parameters with nested struct defaults and optionals
struct S {
    val: Int = 5;
    opt: String?;
}

contract ParamNested(
    s: S,
    note: String?,
    flag: Bool?,
) {
    receive() {
        let _ = self.s.val;
    }
}