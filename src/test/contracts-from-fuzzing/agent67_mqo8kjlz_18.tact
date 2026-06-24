struct Mixed {
    a: Int = 5;
    b: Bool;
    c: String? = null;
}

contract TestContract {
    m: Mixed;

    init() {
        self.m = Mixed{ b:true };
    }
}