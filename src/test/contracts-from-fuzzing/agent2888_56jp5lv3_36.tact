// contract parameter with nested optional struct with optional string
struct SubS {
    note: String?;
}

contract NestedParam(
    ss: SubS?,
    flag: Bool?,
) {
    receive() {
        let _ = self.flag;
    }
}