struct One {
    i: Int;
}

struct Two {
    o: One;
    i: Int;
}

struct Three {
    t: Two;
    s: String;
}

contract TestContract {
    data: Three;

    init() {
        self.data = Three{t: Two{o:One{i:1},i:2}, s:"hi"};
    }
}