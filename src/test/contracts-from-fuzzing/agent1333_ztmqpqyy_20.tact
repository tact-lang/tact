struct InnerStruct {
    val: Int?;
}

message Msg {
    nested: InnerStruct?;
}

struct TopStruct {
    m: Msg?;
}

contract TestContract {
    top: TopStruct? = null;

    init() {}

    receive() {
        if(self.top != null && self.top!!.m != null && self.top!!.m!!.nested != null && self.top!!.m!!.nested!!.val != null) {
            dump(self.top!!.m!!.nested!!.val!!);
        }
    }
}