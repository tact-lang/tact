struct InnerNested {
    q: Int;
}

struct Middle {
    inn: InnerNested?;
}

contract DeepOptional {
    deep: Middle;

    init() {
        self.deep = Middle{
            inn: null,
        };
    }
}