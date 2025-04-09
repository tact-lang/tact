// Contract parameter style with nested composite types
contract ParamsStyle(
    a: Int,
    opt: Int?,
    addr: Address?,
    struc: Point,
    maybeStruc: Point?
) {
    receive() {
        // do nothing
    }
}

struct Point {
    x: Int;
    y: Int;
}
