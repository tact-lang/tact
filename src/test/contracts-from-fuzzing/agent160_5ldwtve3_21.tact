struct SOp {
    val: Int?;
}

contract TestOptInit {
    s: SOp;
    init() {
        self.s = SOp{ val: null };
    }
}