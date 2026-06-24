struct Inner1 { x: Int }
struct Inner2 { y: Int }
struct Wrapper {
    a: Inner1;
    b: Inner2;
}

contract TestContract {
    val: Wrapper;
    init() {
        self.val = Wrapper{
            a: Inner1{ x: 1 },
            b: Inner2{ y: 2 }
        };
    }
}