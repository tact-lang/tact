struct MixedFields {
    id: Int;
    title: String;
    flag: Bool;
    optAddr: Address?;
    optCell: Cell?;
    optStr: String?;
}

contract TestContract {
    data: MixedFields;

    init() {
        self.data = MixedFields{
            id: 5,
            title: "Mega",
            flag: true,
            optAddr: null,
            optCell: null,
            optStr: null
        };
    }
}