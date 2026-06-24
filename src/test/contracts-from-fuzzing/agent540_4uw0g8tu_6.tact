struct Deep1 {
    a: Int;
}

struct Deep2 {
    nested: Deep1;
}

struct Deep3 {
    nested: Deep2;
}

struct Deep4 {
    nested: Deep3;
}

contract VeryDeep {
    storage: Deep4;

    init() {
        self.storage = Deep4{
            nested: Deep3{
                nested: Deep2{
                    nested: Deep1{ a: 42 }
                }
            }
        };
    }
}