trait T1 {
    a: Int;
}

trait T2 {
    b: Int;
}

contract TraitConflictTest with T1, T2 {
    a: Int;
    b: Int;

    init() {
        self.a = 1;
        self.b = 2;
    }
}