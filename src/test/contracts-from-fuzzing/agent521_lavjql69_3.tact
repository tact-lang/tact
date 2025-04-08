struct DeeplyNested {
    inner: Inner;
}

struct Inner {
    inner2: Inner2;
}

struct Inner2 {
    intVal: Int;
    boolVal: Bool;
    optVal: Bool?;
}

contract DeepContract {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            inner: Inner{
                inner2: Inner2{
                    intVal: 10,
                    boolVal: true,
                    optVal: false,
                }
            }
        };
    }
}