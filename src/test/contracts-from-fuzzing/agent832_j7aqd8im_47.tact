struct HasString {
    s: String;
}

contract OptionalStringStruct {
    foo: HasString? = null;
    receive() {
        if (self.foo != null) {
            let _ = self.foo!!;
        }
    }
}