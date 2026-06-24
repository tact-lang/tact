struct Inner1 { x: Int }
struct Inner2 { y: Int }
struct Wrapper {
    i1: Inner1;
    i2: Inner2;
}
contract MultipleStructsInOneVar {
    val: Wrapper;

    init() {
        self.val = Wrapper{
            i1: Inner1{ x: 10 },
            i2: Inner2{ y: 20 },
        };
    }
}