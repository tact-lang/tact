// top level contract params both optional and required, nested with struct fields with their own optionals
struct Inn {
    x: Int?;
    y: Bool;
}

contract OptReqMix(
    a: Int?,
    b: Bool,
    c: String?,
    d: Inn,
) {
    receive() {
        let _ = self.b;
    }
}