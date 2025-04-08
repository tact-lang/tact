struct SSub { 
    foo: Int; 
    bar: String; 
}

struct TestIt {
    sub: SSub;
    other: String;
}

contract ShadowNames {
    param: TestIt;

    init() {
        self.param = TestIt{ sub: SSub{ foo:1, bar:"a" }, other:"b" };
    }
}