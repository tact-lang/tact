message(0x1111) MsgParam {
    foo: Int;
}

contract ParamMsgTest(
    param: MsgParam,
) {
    receive() {
        dump(self.param.foo);
    }
}
