struct DeepNested {
    inner1: Inner1;
    val: Int;
}

struct Inner1 {
    inner2: Inner2;
    flag: Bool;
}

struct Inner2 {
    x: Int;
    inner3: Inner3;
}

struct Inner3 {
    y: Int;
    z: Bool;
}

contract DeepNestedStruct {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner1: Inner1{
                inner2: Inner2{
                    x: 10,
                    inner3: Inner3{
                        y: 20,
                        z: true,
                    },
                },
                flag: false,
            },
            val: 42,
        };
    }
}
