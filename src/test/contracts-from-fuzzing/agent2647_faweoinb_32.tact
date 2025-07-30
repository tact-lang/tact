message(10) MyMsg { foo: Int }

contract OptMsgField {
    val: MyMsg?;

    init() {
        self.val = null;
    }
}