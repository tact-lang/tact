struct OuterOption {
    inner: Int?;
}

contract OptionStructField {
    fld: OuterOption;

    init() {
        self.fld = OuterOption{ inner: null };
    }
}