contract NestedOptionParams(
    a: Int?,
    b: InnerOptParams?
) {
    receive() {
        let _ = self.a;
        let _ = self.b;
    }
}

struct InnerOptParams {
    x: Int?;
    y: Bool?;
}
