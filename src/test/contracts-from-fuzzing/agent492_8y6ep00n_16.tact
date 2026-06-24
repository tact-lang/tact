contract TestContract {
    num: Int;
    optStruct: Test?;

    init() {
        self.num = 123;
        self.optStruct = Test{x:7};
    }
}

struct Test {
    x: Int;
}