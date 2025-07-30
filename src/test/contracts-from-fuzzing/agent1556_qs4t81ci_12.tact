// optional deeply nested struct
struct Nest1 { val: Int = 1; }
struct Nest2 { inner: Nest1?; }
struct Nest3 { inner2: Nest2?; }

contract TestContract {
    n: Nest3 = Nest3{inner2: Nest2{inner: Nest1{val: 42}}};

    init() {
        self.n = Nest3{inner2: null};
    }

    receive() {
        let _ = self.n.inner2;
    }
}