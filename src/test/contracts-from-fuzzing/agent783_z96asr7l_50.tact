struct OptSer {
    small: Int? as uint32;
}

contract OptSerdeTest {
    data: OptSer;

    init() {
        self.data = OptSer { small: null };
    }
}