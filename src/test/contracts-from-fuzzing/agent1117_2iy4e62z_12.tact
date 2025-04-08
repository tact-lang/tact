struct StringOpt {
    val: String?;
}

contract ContractOptStr {
    data: StringOpt;

    init() {
        self.data = StringOpt{ val: null };
    }
}
