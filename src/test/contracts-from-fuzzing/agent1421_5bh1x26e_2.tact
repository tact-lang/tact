struct SubData {
    info: String?;
    flag: Bool?;
}

contract NestedOptionals {
    data: SubData;

    init() {
        self.data = SubData{ info: null, flag: null };
    }
}