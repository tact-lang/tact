struct OptInner {
    x: Int?;
}
struct OptOuter {
    inner: OptInner?;
    y: Int;
}

contract TestContract {
    val: OptOuter;

    init() {
        self.val = OptOuter{
            inner: OptInner{x: null},
            y: 7
        };
    }
}