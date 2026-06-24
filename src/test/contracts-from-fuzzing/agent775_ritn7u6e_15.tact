message(42) OptMsg {
    x: Int;
    y: Bool?;
}

contract StoreOptionalMsg {
    m: OptMsg? = null;

    init() {
        self.m = OptMsg{ x: 5, y: null };
    }
}