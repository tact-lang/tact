struct InnerMost { val: Int }

struct Middle1 { inner: InnerMost }
struct Middle2 { inner: Middle1 }
struct Middle3 { inner: Middle2 }
struct Middle4 { inner: Middle3 }
struct Middle5 { inner: Middle4 }

contract VeryDeepStructStore {
    v: Middle5;

    init() {
        self.v = Middle5{inner:Middle4{inner:Middle3{inner:Middle2{inner:Middle1{inner:InnerMost{val:5}}}}}};
    }
}