struct Serialized {
    val: Int as uint16;
}

contract TestContract {
    dat: Serialized?;

    init() {
        self.dat = Serialized{ val: 12345 };
    }
}