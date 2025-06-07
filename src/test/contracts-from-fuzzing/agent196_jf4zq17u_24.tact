struct Inner1 {
    i1: Int;
}

struct Inner2 {
    i2: Int;
    inside: Inner1;
}

struct Inner3 {
    i3: Int;
    inside: Inner2;
}

contract DeepChain {
    chain: Inner3;

    init() {
        self.chain = Inner3{
            i3: 3,
            inside: Inner2{
                i2: 2,
                inside: Inner1{
                    i1: 1,
                },
            },
        };
    }
}