struct Char {
    s: String;
}

struct OptChar {
    val: Char?;
}

contract OptCharContract {
    x: OptChar;

    init() {
        self.x = OptChar{ val: null };
    }
}