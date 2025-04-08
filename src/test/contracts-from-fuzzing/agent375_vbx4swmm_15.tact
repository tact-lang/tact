struct S {
    a: Int;
    b: Bool?;
}

contract TestContract(
    data: S,
    flag: Bool,
    optStr: String?
) {
    receive() {
        let _ = self.data;
        let _ = self.flag;
        let _ = self.optStr;
    }
}