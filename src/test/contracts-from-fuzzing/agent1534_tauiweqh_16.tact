struct WithConstDefault {
    a: Int = 1 + 2;
    b: String = "hello";
}

contract TestContract {
    val: WithConstDefault;

    init() {
        self.val = WithConstDefault{
            a: 3,
            b: "hi",
        };
    }
}