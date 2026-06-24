struct OnlyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract OnlyOptionalsStorage {
    data: OnlyOptionals;

    init() {
        self.data = OnlyOptionals{
            a: null,
            b: null,
            c: null,
        };
    }
}