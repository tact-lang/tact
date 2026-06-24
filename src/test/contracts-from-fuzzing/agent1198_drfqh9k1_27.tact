message(0x5678) OptMsg {
    data: Int;
}

contract PersistOptMsg {
    m: OptMsg?;

    init() {
        self.m = null;
    }

    receive() {
        self.m = OptMsg{ data: 77 };
    }
}