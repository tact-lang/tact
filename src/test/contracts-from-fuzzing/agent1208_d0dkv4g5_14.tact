struct Foo {
    x: Int;
    y: Bool;
}

contract MultiOptionals {
    optInt: Int?;
    optStruct: Foo?;

    init() {
        self.optInt = null;
        self.optStruct = Foo{ x: 99, y: false };
    }
}