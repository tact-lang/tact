struct DeeplyNested {
    a: Inner1;
}

struct Inner1 {
    b: Inner2;
}

struct Inner2 {
    c: Inner3;
}

struct Inner3 {
    d: Int;
    e: Bool?;
}

contract TestContract {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            a: Inner1{
                b: Inner2{
                    c: Inner3{ d: 42, e: null }
                }
            }
        };
    }
}