struct Deep {
    x: Int;
    y: Bool;
}

contract T {
    d1: Deep?;
    d2: Deep?;
    d3: Deep?;
    d4: Deep?;

    init() {
        self.d1 = null;
        self.d2 = null;
        self.d3 = null;
        self.d4 = null;
    }
}