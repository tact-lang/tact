struct Sub {
    x: Int;
}

contract TestContract {
    opt: Sub?;
    val: Int;

    init() {
        self.opt = Sub{x: 5};
        self.val = 6;
    }
}