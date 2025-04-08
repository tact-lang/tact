struct DeeplyNested {
    inner1: Inner1;
}

struct Inner1 {
    inner2: Inner2;
}

struct Inner2 {
    inner3: Inner3;
}

struct Inner3 {
    field: Int;
}

contract TestContract {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            inner1: Inner1{
                inner2: Inner2{
                    inner3: Inner3{
                        field: 42
                    }
                }
            }
        };
    }
}