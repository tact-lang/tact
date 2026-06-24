struct Tiny {
    x:Int;
}

contract TinyHolder {
    st: Tiny;

    init() {
        self.st = Tiny{ x:1 };
    }
}