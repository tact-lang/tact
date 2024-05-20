fun checkIf(x: Int, y: Int): Int {
    if (x < y) {
        return x;
    } else {
        return y;
    }
}

contract SampleContract {
    x: Int;

    init() {
        if (1 > 0) {
            self.x = 1;
        } else {
            self.x = 0;
        }
    }
}