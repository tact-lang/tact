struct DeepNested {
    foo: Int;
    bar: Inner1;
}

struct Inner1 {
    x: Int;
    y: Inner2;
}

struct Inner2 {
    z: Int?;
    w: Inner3;
}

struct Inner3 {
    flag: Bool;
    note: String?;
}

contract NestedStorage {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            foo: 1,
            bar: Inner1{
                x: 2,
                y: Inner2{
                    z: null,
                    w: Inner3{
                        flag: true,
                        note: null,
                    }
                }
            }
        };
    }
}