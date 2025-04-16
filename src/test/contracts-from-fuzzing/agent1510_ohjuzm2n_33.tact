struct Inner {
    a: Int = pow(2,3);
    b: Bool?;             // implicit null
}

struct Outer {
    nested: Inner;
    val: Int? = null;
    flag: Bool = true;
}

contract TestContract {
    data: Outer = Outer{nested: Inner{}, val: null, flag: false};

    init() {
        self.data = Outer{nested: Inner{}, val: null, flag: true};
    }

    receive() {
        let _ = self.data;
    }
}