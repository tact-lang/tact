struct HasOptional {
    n: Int?;
    flag: Bool = false;
}

struct Wrap {
    inner: HasOptional;
}

contract OptionalNested {
    data: Wrap;

    init() {
        self.data = Wrap{
            inner: HasOptional{
                n: null,
                flag: true,
            }
        };
    }
}