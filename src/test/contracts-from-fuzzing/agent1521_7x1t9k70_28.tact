trait T1 { a: Int }
trait T2 { b: Bool }

contract MultiInherit with T1, T2 {
    a: Int;
    b: Bool;

    init() {
        self.a = 10;
        self.b = true;
    }
}