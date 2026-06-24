// Contract with a struct having empty string/default string field
struct SDefaultStr {
    s: String = "";
}

contract StructEmptyString {
    sf: SDefaultStr;

    init() {
        self.sf = SDefaultStr{};
    }
}