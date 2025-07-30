struct DeepNested {
    inner1: Inner1;
}

struct Inner1 {
    inner2: Inner2;
}

struct Inner2 {
    inner3: Inner3?;
}

struct Inner3 {
    flag: Bool;
    count: Int;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner1: Inner1{
                inner2: Inner2{
                    inner3: Inner3{
                        flag: true,
                        count: 42,
                    }
                }
            }
        };
    }
}
