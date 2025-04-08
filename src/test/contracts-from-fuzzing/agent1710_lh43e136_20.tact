struct Deep {
    s: Small;
}

struct Small {
    flag: Bool;
    text: String;
}

contract DeepChain {
    data: Deep;

    init() {
        self.data = Deep{ s: Small{ flag: true, text: "yo" } };
    }
}