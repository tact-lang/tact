struct Inner {
    a: Int;
    b: Int;
}

contract DuplicatedFieldNames {
    data1: Inner;
    data2: Inner;

    init() {
        self.data1 = Inner{a:1,b:2};
        self.data2 = Inner{a:3,b:4};
    }
}