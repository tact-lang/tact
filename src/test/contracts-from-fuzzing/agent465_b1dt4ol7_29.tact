// Contract with contract parameters (persistent fields) with nested optional
contract Params(
    value: Int?,
    flag: Bool?,
    label: String?,
) {
    receive() {
        // dummy reference to fields
        let _ = self.value;
        let _ = self.flag;
        let _ = self.label;
    }
}
