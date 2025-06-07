struct Inner {
    val: Int?;
}

message MyMsg {
    nested: Inner?;
}

contract TestContract {
    data: MyMsg? = null;

    init() {}

    receive() {
        if (self.data != null && self.data!!.nested != null && self.data!!.nested!!.val != null) {
            dump(self.data!!.nested!!.val!!);
        }
    }
}