struct OptPrimitives {
    name: String?;
    data: Slice?;
    count: Int;
}

contract OptPrimContract {
    info: OptPrimitives;

    init() {
        self.info = OptPrimitives{name: null, data: null, count: 0};
    }
}