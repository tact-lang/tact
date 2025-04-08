// test Struct defaulted field inside contract param
struct DefParamS {
    v: Int = 123;
    s: String = "hello";
}

contract ParamWithDef(
    param: DefParamS,
) {
    receive() {
         let _ = self.param.v;
    }
}