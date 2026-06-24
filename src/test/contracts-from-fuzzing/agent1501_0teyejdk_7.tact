struct Inner1 {
    v1: Int;
}

struct Inner2 {
    v2: Inner1;
}

struct Inner3 {
    v3: Inner2;
}

struct Inner4 {
    v4: Inner3;
}

contract DeeplyNested {
    testData: Inner4;

    init() {
        self.testData = Inner4{
            v4: Inner3{
                v3: Inner2{
                    v2: Inner1{
                        v1: 1234
                    }
                }
            }
        };
    }
}