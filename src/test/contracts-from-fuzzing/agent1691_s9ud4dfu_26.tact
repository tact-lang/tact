struct OptSer {
    a: Int? as int64;
    b: Bool?;
}

contract OptSerTest {
    val: OptSer;

    init() {
        self.val = OptSer{
            a: null,
            b: null
        };
    }
}