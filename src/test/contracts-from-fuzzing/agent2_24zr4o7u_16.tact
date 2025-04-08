struct Small {
    a: Int;
}

struct Wrap1 {
    inner: Small?;
}

struct Wrap2 {
    inner: Wrap1?;
}

struct Wrap3 {
    inner: Wrap2?;
}

contract DeeplyWrapped {
    data: Wrap3;

    init() {
        self.data = Wrap3{
            inner: Wrap2{
                inner: Wrap1{
                    inner: Small{ a: 5 }
                }
            }
        };
    }
}