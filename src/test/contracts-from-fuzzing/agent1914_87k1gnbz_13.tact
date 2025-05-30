struct OptDeepMany {
    a: Int?;
    b: Inner?;
    c: Inner?;
}

struct Inner {
    d: Int?;
    e: Int;
}

contract TestContract {
    od: OptDeepMany;

    init() {
        self.od = OptDeepMany {
            a: null,
            b: null,
            c: Inner{ d: null, e:5 }
        };
    }
}