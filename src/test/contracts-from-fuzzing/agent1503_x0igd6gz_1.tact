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
    val: Int;
}

contract TestContract {
    field: DeepNested;

    init() {
        self.field = DeepNested {
            s1: Inner1 {
                s2: Inner2 {
                    s3: Inner3 {
                        val: 42
                    }
                }
            }
        };
    }
}
