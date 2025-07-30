struct OptStruct {
    innerOpt: Inner?;
}

struct Inner {
    foo: Int;
    barOpt: Bool?;
}

contract TestContract {
    os: OptStruct;

    init() {
        self.os = OptStruct{innerOpt: null};
    }

    receive() {
        if (self.os.innerOpt != null) {
            let _ = self.os.innerOpt!!.foo;
            if (self.os.innerOpt!!.barOpt != null) {
                let _ = self.os.innerOpt!!.barOpt!!;
            }
        }
    }
}