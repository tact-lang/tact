// Large contract param list, many optional primitives
contract BigParamOptional(
    a: Int?,
    b: Int?,
    c: Bool?,
    d: Bool?,
    e: String?,
    f: Address?,
    g: Cell?,
    h: Slice?
) {
    receive() {
        if (self.a != null) {
            let _ = self.a!!;
        }
    }
}