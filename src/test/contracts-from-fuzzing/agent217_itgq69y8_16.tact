struct MaybeData {
    val: Int;
    txt: String;
}

contract NullableTopStruct {
    optData: MaybeData?;

    init() {
        self.optData = null;
    }
}