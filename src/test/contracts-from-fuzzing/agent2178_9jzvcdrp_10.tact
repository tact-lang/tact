struct A {
    foo: String;
    bar: Int;
}

contract OptNestedStructOpt {
    optStruct: A?;

    init() {
        self.optStruct = null;
    }
}