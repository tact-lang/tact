struct InnerOptional {
    flag: Bool?;
}

struct OuterMultiple {
    inner: InnerOptional;
    count: Int?;
    text: String?;
}

contract ManyOptionals {
    big: OuterMultiple;
    init() {
        self.big = OuterMultiple{
            inner: InnerOptional{flag: null},
            count: null,
            text: null
        };
    }
}