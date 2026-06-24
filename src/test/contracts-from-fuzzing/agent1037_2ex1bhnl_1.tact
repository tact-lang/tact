struct DeepNest {
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
    data: String;
}

contract TestContract {
    state: DeepNest;

    init() {
        self.state = DeepNest{
            inner1: Inner1{
                inner2: Inner2{
                    inner3: Inner3{
                        flag: true,
                        data: "hello"
                    }
                }
            }
        };
    }
}
