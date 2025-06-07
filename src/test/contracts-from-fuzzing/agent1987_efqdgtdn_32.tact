struct Outer {
    nested: Inner?;
}

struct Inner {
    s1: String?;
    s2: String?;
}

contract OptionalStrings {
    data: Outer;
    init() {
        self.data = Outer{
            nested: Inner{s1:null,s2:"test"}
        };
    }
}