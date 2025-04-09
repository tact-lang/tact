struct Embed1 {
    val1: Int;
}

struct Embed2 {
    val2: Int;
}

contract DoubleEmbed {
    e1: Embed1;
    e2: Embed2;

    init() {
        self.e1 = Embed1{ val1: 11 };
        self.e2 = Embed2{ val2: 22 };
    }
}