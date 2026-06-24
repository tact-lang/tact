struct Deeply {
    one: Int;
    two: Inner1;
}

struct Inner1 {
    three: Int;
    four: Inner2;
}

struct Inner2 {
    five: Int;
    six: Inner3;
}

struct Inner3 {
    seven: Int;
}


contract DeeplyNested {
    d: Deeply;

    init() {
        self.d = Deeply{
            one:1,
            two: Inner1{
                three:3,
                four: Inner2{
                    five:5,
                    six: Inner3{
                        seven:7
                    }
                }
            }
        };
    }
}