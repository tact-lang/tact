struct Core {
    score: Int = 99;
}

struct Holder {
    core: Core;
}

contract TestContract {
    val: Holder;

    init() {
        self.val = Holder{ core: Core{} };
    }

    receive() {}
}