struct ManyNested {
    one: Int;
    two: Bool;
    three: Address;
    four: Slice;
    five: String;
    six: Int?;
    seven: Bool?;
    eight: Address?;
    nine: String?;
}

contract ComplexStructTest {
    foo: ManyNested;

    init() {
        self.foo = ManyNested{
            one: 1,
            two: true,
            three: myAddress(),
            four: emptyCell().asSlice(),
            five: "hello",
            six: 6,
            seven: false,
            eight: myAddress(),
            nine: "opt"
        };
    }
}