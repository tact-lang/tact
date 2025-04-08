struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OpsTest {
    test: ManyOptionals;

    init() {
        self.test = ManyOptionals{
            a: null,
            b: true,
            c: null,
        };
    }
}
