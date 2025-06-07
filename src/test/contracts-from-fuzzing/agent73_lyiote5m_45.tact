@interface("iface")
contract ParamTest(
    p1: Int,
    p2: Address,
    p3: Cell,
    p4: String,
    p5: Bool
) {
    receive() {
        // no-op
    }
}