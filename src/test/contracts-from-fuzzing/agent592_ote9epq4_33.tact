struct Small {
    m: Int = 3;
}

struct Mid {
    s: Small = Small{};
}

struct Large {
    m: Mid = Mid{};
}

contract TestContract {
    big: Large;

    init() {
        self.big = Large{};
    }

    receive() {}
}