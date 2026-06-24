struct DeepNested {
    sub: Inner1;
}

struct Inner1 {
    sub: Inner2;
}

struct Inner2 {
    sub: Inner3;
}

struct Inner3 {
    i: Int;
    fl: Bool;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            sub: Inner1{
                sub: Inner2{
                    sub: Inner3{
                        i: 1,
                        fl: true
                    }
                }
            }
        };
    }
}
