struct Outer {
    nested: Inner;
}

struct Inner {
    deeply: Deep;
}

struct Deep {
    optional: Int?;
}

contract ExpOptNested {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{
                deeply: Deep{
                    optional: null
                }
            }
        };
    }
}