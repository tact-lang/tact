struct Pair {
    x: Int;
    y: Int;
}

contract WithOptionals {
    coord: Pair?;

    init() {
        self.coord = null;
    }
}