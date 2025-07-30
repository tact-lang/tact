struct Inner {
    boolFlag: Bool;
    someInt: Int;
}

struct OuterOptional {
    nested: Inner?;
    anotherInt: Int;
}

contract OuterOptionalTest {
    data: OuterOptional;
    init() {
        self.data = OuterOptional{
            nested: null,
            anotherInt: 777,
        };
    }
}