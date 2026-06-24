struct Struc {
    x: Int;
    y: Bool?;
}

contract OptionalsEdge {
    optVal: Struc?;

    init() {
        self.optVal = null;
    }
}