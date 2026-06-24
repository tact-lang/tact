struct OptOpt {
    foo: Int?;
    bar: Bool?;
}

contract OptionalRoot {
    val: OptOpt?;

    init() {
        self.val = OptOpt{ foo: null, bar: null };
    }

    receive() {
        if (self.val != null) {
            let fooVal = self.val!!.foo;
            let barVal = self.val!!.bar;
        }
    }
}
