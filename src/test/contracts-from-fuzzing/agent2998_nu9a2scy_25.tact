struct Struct1 {
    x: Int;
    y: Bool;
}
struct Struct2 {
    inner: Struct1;
}
struct Struct3 {
    inner: Struct2;
}

contract FlattenNested {
    nested: Struct3;
    init() {
        self.nested = Struct3{
            inner: Struct2{
                inner: Struct1{
                    x: 9,
                    y: true,
                },
            },
        };
    }
}