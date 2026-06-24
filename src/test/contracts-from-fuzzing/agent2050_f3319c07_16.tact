struct PartOpt {
    fa: Int?;
    fb: Int?;
    fc: Int?;
    fd: Int?;
    fe: Int?;
}

contract OptStructTest {
    so: PartOpt;

    init() {
        self.so = PartOpt{
            fa:null, fb:null, fc:null, fd:null, fe:null
        };
    }
}