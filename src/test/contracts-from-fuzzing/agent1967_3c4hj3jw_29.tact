contract TestContract {
    foo: MyStruct;
    init() {
        self.foo = MyStruct{
            bar: BarStruct{
                a: 1,
                b: null
            },
            val: 10
        };
    }
}

struct MyStruct {
    bar: BarStruct;
    val: Int;
}

struct BarStruct {
    a: Int;
    b: Bool?;
}
