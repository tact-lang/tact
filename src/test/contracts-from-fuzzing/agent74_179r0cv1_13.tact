struct Mixed {
    a: Int = 1;
    b: Bool;
    c: Int?;
    d: Bool = false;
}

contract TestContract {
    data: Mixed;

    init() {
        self.data = Mixed{ b: true };
    }
}