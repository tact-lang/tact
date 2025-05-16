// missing one persistent field init but it has default, expect OK
contract Test {
    a: Int;
    b: Int = 5;

    init() {
        self.a = 1;
    }
}