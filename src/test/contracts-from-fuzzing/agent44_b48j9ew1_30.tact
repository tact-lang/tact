struct AInner {
    s: String?;
}

struct AOuter {
    a: Int;
    inn: AInner;
}

contract OptWrap {
    wrapped: AOuter?;

    init() {
        self.wrapped = null;
    }

    receive() {
        self.wrapped = AOuter{ a: 5, inn: AInner{ s: null } };
    }
}