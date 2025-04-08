struct Composite {
    i: Int;
    b: Bool;
    s: String;
    n: Int?;
    ob: Bool?;
    os: String?;
}

contract TestContract {
    val1: Composite;
    val2: Composite;
    val3: Composite;

    init() {
        self.val1 = Composite{
            i: 1, b: true,  s: "s1", n: null, ob: null, os: null
        };
        self.val2 = Composite{
            i: 2, b: false, s: "s2", n: 3,    ob: true,  os: "opt"
        };
        self.val3 = Composite{
            i: 4, b: true,  s: "s3", n: 5,    ob: false, os: null
        };
    }
}