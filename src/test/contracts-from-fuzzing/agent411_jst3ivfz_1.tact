contract DeepNest {
    data: Int;
    nest: Nest1;

    init() {
        self.data = 0;
        self.nest = Nest1{
            sub: Nest2{
                subsub: Nest3{
                    val: 42
                }
            }
        };
    }
}

struct Nest1 {
    sub: Nest2;
}

struct Nest2 {
    subsub: Nest3;
}

struct Nest3 {
    val: Int;
}