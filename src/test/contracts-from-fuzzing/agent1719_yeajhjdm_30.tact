struct InnerMost {
    x: Int;
    y: Bool;
}
struct Middle {
    z: InnerMost;
}
contract MultiLevel {
    mid: Middle;

    init() {
        self.mid = Middle{
            z: InnerMost{
                x: 1,
                y: false
            }
        };
    }
}