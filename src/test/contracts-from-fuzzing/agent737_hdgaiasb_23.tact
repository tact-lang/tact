struct OptNest {
    a: Bool?;
    b: String?;
    c: Int?;
}

contract TestContract {
    myData: OptNest;

    init() {
        self.myData = OptNest{
            a: null,
            b: null,
            c: 1
        };
    }
}
