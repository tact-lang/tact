message(0x1234) Msgy { x: Int; }

struct Wrapper {
    m: Msgy?;
    note: String;
}

contract OptMsgStructStorage {
    stored: Wrapper;

    init() {
        self.stored = Wrapper{ m: null, note: "none" };
    }
}