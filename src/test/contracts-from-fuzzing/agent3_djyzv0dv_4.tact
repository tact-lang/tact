struct Inner { m: map<Int, Int>; }

contract TestContract {
    bar: Inner;

    init() {
        self.bar = Inner{ m: emptyMap() };
    }
}