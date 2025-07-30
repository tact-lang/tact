contract MultipleStructsStorage {
    foo: FooStruct;
    bar: BarStruct;

    init() {
        self.foo = FooStruct{
            a: 1,
            b: 2
        };
        self.bar = BarStruct{
            flag: true,
            txt: "hello"
        };
    }
}

struct FooStruct {
    a: Int;
    b: Int;
}

struct BarStruct {
    flag: Bool;
    txt: String;
}