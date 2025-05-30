struct InnerParam {
    x: Int;
    y: String;
}

contract ParamStructs(
    p1: Int,
    p2: Bool,
    p3: InnerParam
) {
    receive() {
        dump(self.p1);
    }
}
