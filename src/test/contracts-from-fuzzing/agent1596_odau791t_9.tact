struct OptionalInStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Container {
    opt: OptionalInStruct;
    value: Int;
}

contract OptionalStructContainer {
    s: Container = Container{
        opt: OptionalInStruct{ a: null, b: false, c: null },
        value: 10
    };

    receive() {
        let _ = self.s.opt.b;
    }
}