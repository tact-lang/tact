struct Struct0 {
    val: Int;
}

struct Struct1 {
    s: Struct0;
}

struct Struct2 {
    s: Struct1;
}

struct Struct3 {
    s: Struct2;
}

contract DeepChain {
    nested: Struct3;

    init() {
        self.nested = Struct3{
            s: Struct2{
                s: Struct1{
                    s: Struct0{
                        val: 123,
                    },
                },
            },
        };
    }
}
