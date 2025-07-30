struct Inner {
    val: Int;
}

contract AssignInInit {
    data: Inner;

    init() {
        self.data = Inner{val:42};
    }
}