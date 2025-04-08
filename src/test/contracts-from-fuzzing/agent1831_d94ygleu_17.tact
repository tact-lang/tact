struct SerialOpts {
    x: Int? as int8;
    y: Bool?;
}

contract TestContract {
    prop: SerialOpts;

    init() {
        self.prop = SerialOpts{ x: null, y: null };
    }
}