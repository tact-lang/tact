contract SingleFieldNested {
    data: Data;

    init() {
        self.data = Data{
            nested: Inner{
                flag: true
            }
        };
    }
}

struct Data {
    nested: Inner;
}

struct Inner {
    flag: Bool;
}