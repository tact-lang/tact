struct Pair {
    key: String;
    val: Int;
}

contract Pairs {
    first: Pair = Pair{ key:"a", val:1 };
    second: Pair = Pair{ key:"b", val:2 };

    init() {
        self.first = self.first;
    }

    receive() {
        self.second = self.second;
    }
}