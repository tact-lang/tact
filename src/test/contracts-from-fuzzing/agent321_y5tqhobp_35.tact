// test large struct nested inside contract param
struct BulkParams {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: Bool;
    f: String;
    g: String?;
    h: Int?;
    i: Bool?;
}

contract NestedInParams(
    p: BulkParams,
    x: Int,
    y: Int,
) {
    receive() {
        let _ = self.p;
        let _ = self.x + self.y;
    }
}