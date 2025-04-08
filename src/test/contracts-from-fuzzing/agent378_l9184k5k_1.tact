struct InnerStruct {
    num: Int;
    flag: Bool;
    text: String;
}

contract NestedOptionalContract {
    data: InnerStruct?;

    init() {
        self.data = null;
    }
}