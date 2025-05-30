struct Holder {
    x: Int;
    y: Int;
    s: String;
    b: Bool?;
}

contract TestContract(
    param1: Int,
    param2: Holder,
    param3: String,
    param4: Bool,
) {
    receive() {
        let _ = self.param2.s;
    }
}