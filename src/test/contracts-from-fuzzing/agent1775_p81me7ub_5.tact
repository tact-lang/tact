struct Inner { flag: Bool = true; }

struct Outer { inner: Inner; num: Int = 3; }

contract OptionalNested {
    nestedOpt: Outer?;
    
    init() {
        self.nestedOpt = Outer{ inner: Inner{ flag: false }, num: 77 };
    }
}