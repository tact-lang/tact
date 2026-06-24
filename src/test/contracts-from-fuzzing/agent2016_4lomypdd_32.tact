struct DeepOptInner {
    z: Int?;
}
struct DeepOptMid {
    inner: DeepOptInner?;
}
struct DeepOptOuter {
    mid: DeepOptMid?;
}

contract Test {
    data: DeepOptOuter?;
    init() {
        self.data = DeepOptOuter{ mid: null };
    }
}