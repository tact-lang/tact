struct PartiallyDefaulted {
    a: Int = 5;
    b: Int = 10;
    c: String;
}

contract TestContract {
    mydata: PartiallyDefaulted?;

    init() {
        self.mydata = PartiallyDefaulted{
            c: "hello"
        };
    }
}