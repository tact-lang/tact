struct Basic {
    n: Int;
    b: Bool;
    s: String;
}

contract PersistBasic {
    data: Basic;

    init() {
        self.data = Basic{ n:5, b:true, s:"tact" };
    }
}