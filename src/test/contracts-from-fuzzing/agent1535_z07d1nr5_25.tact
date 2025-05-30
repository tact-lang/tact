message(0x2222) OptMsg {
    foo: Int;
}

contract ParamOptMsgTest(
    param: OptMsg? ,
) {
    receive() {
        if (self.param != null) {
            dump(self.param!!.foo);
        }
    }
}
