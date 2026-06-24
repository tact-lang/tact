struct Rec1 {
    val: Int = 1;
}

struct Rec2 {
    inner: Rec1 = Rec1{};
    opt: Rec1?; // optional nested struct
}

contract TestContract {
    st: Rec2 = Rec2{};

    init() {
        self.st = Rec2{inner: Rec1{val: 5}, opt: null};
    }

    receive() {
        let _ = self.st.inner.val;
        let _ = self.st.opt;
    }
}