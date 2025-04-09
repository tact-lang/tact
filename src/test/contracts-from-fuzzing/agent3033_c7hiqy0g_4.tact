struct Deep3 {
    value: Int;
}

struct Deep2 {
    nested: Deep3;
}

struct Deep1 {
    nested: Deep2;
}

contract TestContract {
    deep: Deep1;

    init() {
        self.deep = Deep1{
            nested: Deep2{
                nested: Deep3{ value: 123 }
            }
        };
    }
}
