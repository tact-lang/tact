struct Inner { num: Int?; }

struct Outer { inner: Inner?; }

contract TestContract {
    myData: Outer;
    init() {
        self.myData = Outer{ inner: Inner{ num: null } };
    }
}