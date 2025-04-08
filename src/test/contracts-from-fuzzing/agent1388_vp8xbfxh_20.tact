struct Inner { foo: Int? = null; }

contract Test {
    data: Inner? = null;

    get fun g(): Inner? {
        return self.data;
    }
}
