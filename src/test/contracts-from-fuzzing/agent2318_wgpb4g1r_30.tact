struct StructParams {
  x: Int;
  y: Bool;
}

contract ParamTest(
    param: StructParams,
    num: Int,
    flag: Bool,
    opt: Int?
) {
    receive() {
        dump(self.num);
        dump(self.flag);
        dump(self.opt);
    }
}
