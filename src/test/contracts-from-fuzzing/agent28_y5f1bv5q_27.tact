struct DeepRec {
    inner: DeepRec2;
}

struct DeepRec2 {
    inner: DeepRec3;
}

struct DeepRec3 {
    inner: DeepRec4;
}

struct DeepRec4 {
    inner: DeepRec5;
}

struct DeepRec5 {
    foo: Int;
    bar: Bool?;
}

contract Test {
    data: DeepRec;

    init() {
        self.data = DeepRec{
            inner: DeepRec2{
                inner: DeepRec3{
                    inner: DeepRec4{
                        inner: DeepRec5{
                            foo: 42,
                            bar: null
                        }
                    }
                }
            }
        };
    }
}