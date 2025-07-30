struct Nested {
    s: String;
    flag: Bool;
}

struct Outer {
    inner: Nested;
    number: Int;
}

contract DeepStruct {
    data: Outer;
    
    init() {
        self.data = Outer{
            inner: Nested{ s: "hi", flag: true },
            number: 99
        };
    }
}
