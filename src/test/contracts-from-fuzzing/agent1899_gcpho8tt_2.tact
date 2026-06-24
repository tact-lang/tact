struct DeepNested {
    s1: Inner1;
}

struct Inner1 {
    s2: Inner2;
}

struct Inner2 {
    s3: Inner3;
}

struct Inner3 {
    x: Int;
    y: Int?;
    txt: String;
}

contract DeepNestedContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            s1: Inner1{
                s2: Inner2{
                    s3: Inner3{
                        x: 1,
                        y: null,
                        txt: "text"
                    }
                }
            }
        };
    }
}