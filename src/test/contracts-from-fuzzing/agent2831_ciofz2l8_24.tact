struct Top {
    a: Int; 
    b: Int?;
    c: Inner?;
}

struct Inner {
    x: Int = 5;
    y: Bool?;
}

contract NestedMixOptional {
    storage: Top;

    init() {
        self.storage = Top{
            a: 1,
            b: null,
            c: null
        };
    }
}
