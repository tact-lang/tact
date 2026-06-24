struct SOpt {
    a: Int = 1;
    b: String = "b";
}

contract Test28 {
    so: SOpt?;
    init() {
        self.so = SOpt{ b: "bb" };
    }
}