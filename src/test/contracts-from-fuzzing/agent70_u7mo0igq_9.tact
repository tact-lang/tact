struct StructWithOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    data: StructWithOptionals;

    init() {
        self.data = StructWithOptionals{
            a: null,
            b: null,
            c: null
        };
    }
}