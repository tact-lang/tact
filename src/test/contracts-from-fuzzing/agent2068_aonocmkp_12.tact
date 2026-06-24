struct Pair {
    a: Int;
    b: Int;
}

struct Nest1 {
    field: Pair;
}

struct Nest2 {
    inner: Nest1;
}

struct Nest3 {
    inner: Nest2;
}

contract Chain {
    content: Nest3;

    init() {
        self.content = Nest3{
            inner: Nest2{
                inner: Nest1{
                    field: Pair{a:1,b:2}
                }
            }
        };
    }
}