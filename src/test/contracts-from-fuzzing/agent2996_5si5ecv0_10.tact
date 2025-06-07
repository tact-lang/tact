struct InnerMost {
    val: Int;
}

struct Wrapped {
    wrapped: InnerMost;
}

struct Container1 {
    inner: Wrapped;
}

struct Container2 {
    deeper: Container1;
}

struct Container3 {
    more: Container2;
}

contract DeepNesting {
    payload: Container3;

    init() {
        self.payload = Container3{
            more: Container2{
                deeper: Container1{
                    inner: Wrapped{
                        wrapped: InnerMost{ val: 5 }
                    }
                }
            }
        };
    }
}