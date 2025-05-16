struct OptSer {
    x: Int? as uint8;
}

contract OptSerContract {
    data: OptSer;

    init() {
        self.data = OptSer {
            x: null
        };
    }
}