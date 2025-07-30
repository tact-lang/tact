struct AltBS {
    b1: Bool = false;
    s1: String;
    b2: Bool;
    s2: String = "d";
    b3: Bool;
    s3: String;
}

contract AltBSContract {
    st: AltBS;

    init() {
        self.st = AltBS{
            s1: "one",
            b2: true,
            s3: "three",
            b3: false
        };
    }
}