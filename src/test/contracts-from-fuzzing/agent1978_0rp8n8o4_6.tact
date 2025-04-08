struct Nested {
    s1: String;
    s2: String?;
    num: Int;
    flag: Bool;
}

contract StringsAndOptionals {
    x: Nested;
    
    init() {
        self.x = Nested{
            s1: "foo",
            s2: null,
            num: 123,
            flag: false
        };
    }
}