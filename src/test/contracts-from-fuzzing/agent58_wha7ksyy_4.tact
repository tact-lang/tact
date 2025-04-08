struct Inner {
    x: Int;
}

contract OptionalFieldContract {
    optField: Inner? = null;

    receive() {
        if (self.optField != null) {
            let _ = self.optField!!.x;
        }
    }
}