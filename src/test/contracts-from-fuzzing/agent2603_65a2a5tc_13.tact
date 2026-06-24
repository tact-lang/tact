struct Simple {
    v: Int;
}

struct Mid1 {
    f: Simple;
}

struct Mid2 {
    f: Mid1;
}

struct Mid3 {
    f: Mid2;
}

contract LayeredDeep {
    content: Mid3;

    init() {
        self.content = Mid3{
            f: Mid2{
                f: Mid1{
                    f: Simple{
                        v: 111
                    }
                }
            }
        };
    }
}
