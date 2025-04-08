struct MultiNullables {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Slice?;
}

contract MultipleNullable {
    val: MultiNullables;

    init() {
        self.val = MultiNullables{
            a:null,
            b:null,
            c:null,
            d:null,
            e:null
        };
    }
}