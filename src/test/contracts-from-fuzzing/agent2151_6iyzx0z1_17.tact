struct OptionalStruct {
    inner1: Int?;
    inner2: Int?;
}

contract StructOpt {
    val: OptionalStruct?;

    init() {
        self.val = null;
    }
}