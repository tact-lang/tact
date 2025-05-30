struct Metadata {
    title: String?;
    flag: Bool;
    extra: Cell as remaining;
}

contract MetaRemains {
    info: Metadata;

    init() {
        self.info = Metadata{
            title: "abc",
            flag: true,
            extra: emptyCell(),
        };
    }
}