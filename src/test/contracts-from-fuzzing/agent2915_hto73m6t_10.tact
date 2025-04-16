struct Lots {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int = 2;
    e: Bool = true;
    f: String = "hello";
    g: Int?;
    h: Bool?;
    i: String?;
    j: Int = 99;
    k: Bool;
    l: String;
}

contract TestContract {
    data: Lots;

    init() {
        self.data = Lots{
            k: false,
            l: "test"
        };
    }
}
