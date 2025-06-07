struct StructWithLongString {
    txt: String;
}

contract ContractWithLongString {
    fld: StructWithLongString;

    init() {
        self.fld = StructWithLongString{
            txt: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        };
    }
}
