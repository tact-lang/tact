struct NestedOpt {
    x: Int?;
    y: Inner?;
}
struct Inner {
    z: Bool?;
}
contract NestedOptionalsFields {
    opt: NestedOpt;
    init() {
        self.opt = NestedOpt{ x:null, y:null };
    }
}