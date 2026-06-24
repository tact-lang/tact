struct Embed {
    flag: Bool;
    count: Int;
}

contract NestedStruct {
    data: Embed;

    init() {
        self.data = Embed{ flag: true, count: 99 };
    }
}
