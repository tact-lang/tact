struct Params {
    flag: Bool;
    count: Int as uint8;
    note: String;
}

contract ParamInitContract(
    param: Params,
) {
    receive() {
        // dummy usage
        let _ = self.param.flag;
    }
}