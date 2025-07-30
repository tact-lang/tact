struct ComboOptional {
    oi: Int?;
    os: String?;
    ob: Bool?;
    oa: Address?;
}

contract ComboNestedOptional {
    data: ComboOptional?;

    init() {
        self.data = null;
    }
}