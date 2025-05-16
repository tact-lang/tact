// fix invalid ;; in contract
struct InnerParam {
    val: Int;
    flag: Bool;
}

contract TestParamNested(
    ip: InnerParam,
    count: Int
) {
    receive() {
        let _ = self.ip;
        let _ = self.count;
    }
}
