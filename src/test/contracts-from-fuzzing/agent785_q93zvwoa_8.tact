struct Inner {
    id: Int;
    txt: String;
}

contract OptionalsEmbedded {
    ofield: Inner?;
    bfield: Bool;
    ifield: Int;

    init() {
        self.ofield = null;
        self.bfield = false;
        self.ifield = 5;
    }
}