struct Small {
    i: Int;
}

struct Medium {
    s: Small;
}

struct Large {
    m: Medium;
}

contract NestOneEach {
    content: Large;
    init() {
        self.content = Large{ m: Medium{ s: Small{ i:42 }}};
    }
}