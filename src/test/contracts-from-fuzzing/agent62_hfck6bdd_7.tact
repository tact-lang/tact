struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
    e: Int?;
}

contract LotsOfOptionalsStorage {
    state: ManyOptionals;

    init() {
        self.state = ManyOptionals {
            a: null, b: true, c: 42, d: null, e: 7
        };
    }
}