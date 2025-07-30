struct Inner1 { f: Int?; }
struct Inner2 { f: Bool?; }

struct OptionalComposite {
    inner1: Inner1;
    inner2: Inner2;
}

contract OptionalCompositeContract {
    data: OptionalComposite;

    init() {
        self.data = OptionalComposite{
            inner1: Inner1{f: null},
            inner2: Inner2{f: true},
        };
    }
}
