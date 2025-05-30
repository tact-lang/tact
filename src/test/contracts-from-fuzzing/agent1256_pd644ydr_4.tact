struct Nester1 {
    foo: Int?;
}
struct Nester2 {
    nested1: Nester1;
    bar: String?;
}
struct Nester3 {
    nested2: Nester2;
    baz: Bool?;
}

contract DeepNullable {
    data: Nester3;

    init() {
        self.data = Nester3{
            nested2: Nester2{
                nested1: Nester1{ foo: null },
                bar: null
            },
            baz: null
        };
    }
}
