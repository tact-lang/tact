// verify optional contract persistent fields default to null
contract OptionDefaults {
    foo: Int?;
    flag: Bool?;
    strOpt: String?;

    init() {
        // purposely do not assign fields, expect all null
    }
}