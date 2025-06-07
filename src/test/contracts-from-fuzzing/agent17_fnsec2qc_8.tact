extends fun add(self: Int, other: Int): Int {
    return self + other;
}

contract ExtTest {
    result: Int;

    init() {
        self.result = 3.add(4);
    }

    get fun getResult(): Int {
        return self.result;
    }
}
