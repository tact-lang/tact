struct Partial {
    x: Int = 1;
    y: Bool;
    z: String = "hi";
}

contract TestContract {
    val: Partial;

    init() {
        self.val = Partial{
            y: true
        };
    }
}