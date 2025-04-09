struct SubData {
    foo: Int = 1;
}

contract TestContract {
    nestedOpt: SubData?;

    init() {
        self.nestedOpt = null;
    }

    receive() {
        let v = self.nestedOpt;
        if (v != null) {
            let f = v!!.foo;
        }
    }
}