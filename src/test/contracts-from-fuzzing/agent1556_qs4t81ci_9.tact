// nested optional struct fields
struct Inner {
    foo: Int = 5;
}

struct Outer {
    optInner: Inner?;
    bar: Bool = true;
}

contract TestContract {
    st: Outer = Outer{optInner: null, bar: false};
    
    init() {
        self.st = Outer{optInner: Inner{foo: 999}, bar: true};
    }

    receive() {
        let _ = self.st.optInner;
        let _ = self.st.bar;
    }
}