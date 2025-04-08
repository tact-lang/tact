struct SOpt {
    s1: Int?;
    s2: Bool?;
    s3: Int?;
    s4: Bool?;
}

contract Test {
    inner: SOpt?;

    init() {
        self.inner = null;
    }

    receive() {
        self.inner = SOpt { s1:100, s2:true, s3:200, s4:false };
    }
}