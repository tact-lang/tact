struct Deep {
    nested: Inner;
}

struct Inner {
    x: Int;
    y: Inner2;
}

struct Inner2 {
    a: Int?;
    b: String?;
}

contract ManyNestsStruct {
    field: Deep;

    init() {
        self.field = Deep{
            nested: Inner{
                x:7, y: Inner2{a:null, b:null}
            }
        };
    }
}