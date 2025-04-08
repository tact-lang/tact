struct MultipleOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: String?;
    f: Address?;
}

contract OptStructsStorage {
    content: MultipleOptionals;

    init() {
        self.content = MultipleOptionals{
            a: 1, b: null, c: 3, d: true, e: null, f: null
        };
    }
}