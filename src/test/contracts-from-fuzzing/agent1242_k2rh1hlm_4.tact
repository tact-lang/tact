struct WithDefaultOpt {
    x: Int? = null;
    y: String = "hello";
}

contract TestContract {
    val: WithDefaultOpt;

    init() {
        self.val = WithDefaultOpt{
            y: "world",
        };
    }
}