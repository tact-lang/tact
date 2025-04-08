struct Params {
    i: Int = 5;
    b: Bool = true;
    s: String = "hello";
    o: Int?;
}

contract TestContract {
    prm: Params;
    init() {
        self.prm = Params { };
    }
}