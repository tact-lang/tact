struct AllTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract VariantTest {
    dat: AllTypes;

    init() {
        self.dat = AllTypes{
            a:42,
            b:true,
            c:"test",
            d:null,
            e:null,
            f:null,
        };
    }
}
