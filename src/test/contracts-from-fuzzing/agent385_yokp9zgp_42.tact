message(99) MsgOptTest { f: Int }

contract DefaultNullOptionalMsg {
    optMsg: MsgOptTest? = null;

    init() {
        self.optMsg = null;
    }
}