struct MyData {
    a: Int;
    b: Bool;
}

contract TestOpt {
    val: MyData? = null;

    init() {
        self.val = MyData{ a: 7, b: true };
    }

    receive() {}
}