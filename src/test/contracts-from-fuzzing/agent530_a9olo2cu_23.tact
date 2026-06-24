struct CommaMid {
    x: Int;
    y: Bool;
    z: String;
}

contract CommaTest {
    data: CommaMid;

    init() {
        self.data = CommaMid{
            x:1,
            y:true,
            z:"hi",
        };
    }
}
