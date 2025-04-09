struct NS {
    n: Int;
    s: String;
}

contract StructBigString {
    data: NS;

    init() {
        self.data = NS{n:123, s:"a very very very very very very very long string which may cause problems"};
    }
}