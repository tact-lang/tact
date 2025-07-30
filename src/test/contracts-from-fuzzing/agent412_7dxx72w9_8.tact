message(1) Bar { z: Int }

contract OptMsgField {
    foo: Bar? = null;

    receive() {
        if (self.foo != null) {
            let _ = self.foo!!;
        }
    }
}