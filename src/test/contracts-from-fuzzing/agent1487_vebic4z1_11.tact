struct DF {
    a: Int? = null;
    b: Bool = true;
    c: String = "hi";
    d: Int;
}

contract TestContract {
    data: DF;

    init() {
        self.data = DF{
            d: 777
        };
    }
}