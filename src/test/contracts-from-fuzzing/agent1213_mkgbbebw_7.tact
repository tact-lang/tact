struct DeepManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract ManyOptionalsTest {
    test: DeepManyOptionals;

    init() {
      self.test = DeepManyOptionals{
        a: null,
        b: false,
        c: null,
        d: null,
        e: null,
        f: null,
      };
    }
}