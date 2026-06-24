struct MixedFields {
    si: Int;
    sb: Bool;
    ss: String;
    so: Int?;
    sc: Cell;
    sa: Address;
    sn: String?;
    sb2: Bool?;
}

contract MixedContract {
    field: MixedFields;

    init() {
        self.field = MixedFields{
            si: 1,
            sb: true,
            ss: "hello",
            so: null,
            sc: emptyCell(),
            sa: myAddress(),
            sn: "opt",
            sb2: false
        };
    }
}