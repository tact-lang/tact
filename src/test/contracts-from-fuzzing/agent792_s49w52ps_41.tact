struct SDefaultOpt {
    a: Int? as uint8;
    b: Int? as int8;
}

contract OptSerialization {
    val: SDefaultOpt;

    init() {
        self.val = SDefaultOpt{
            a: null,
            b: null
        };
    }
}