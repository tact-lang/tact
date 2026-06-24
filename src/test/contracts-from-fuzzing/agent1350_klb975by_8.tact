struct NestedManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract NestedManyOptionalsField {
    data: NestedManyOptionals;

    init() {
        self.data = NestedManyOptionals{
            a:null, b:null, c:null, d:null
        };
    }
}