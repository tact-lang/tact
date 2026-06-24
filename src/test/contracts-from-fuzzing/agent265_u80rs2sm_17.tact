struct Ints {
    x: Int;
    y: Int;
    z: Int;
}

contract IntsDirect {
    ints: Ints;

    init() {
        self.ints = Ints{
            x:11,y:22,z:33
        };
    }

    receive() {
        self.ints = self.ints;
    }
}