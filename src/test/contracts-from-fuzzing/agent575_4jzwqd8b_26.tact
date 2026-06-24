struct WrappedPrimitives {
    i: Int;
    b: Bool;
    s: String;
}

contract TestContract {
    w: WrappedPrimitives;

    init() {
        self.w = WrappedPrimitives{ i:1, b:true, s:"ok" };
    }
}
