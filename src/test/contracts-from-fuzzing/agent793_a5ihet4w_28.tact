struct Three {
    first: Int; second: Bool; third: String;
}

contract TestContract {
    s: Three;

    init() {
        self.s = Three{first:1, second:true, third:"ok"};
    }

    receive() {}
}