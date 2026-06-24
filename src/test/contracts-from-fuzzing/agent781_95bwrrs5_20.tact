struct A {
    num: Int;
}

contract TestContract {
    opt: A?;

    init() {
        self.opt = null;
    }
}