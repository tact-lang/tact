// test contract with contract parameter syntax and nested struct param
struct Params {
  id: Int;
  desc: String;
}

contract ParamTest(
    paramStruct: Params,
    count: Int,
    flag: Bool
) {
    receive() {
        // dummy access to make sure params are used
        let _ = self.paramStruct;
        let _ = self.count;
        let _ = self.flag;
    }
}