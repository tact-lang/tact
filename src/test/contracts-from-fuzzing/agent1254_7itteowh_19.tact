struct DeepManyOpts3 {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct DeepManyOpts2 {
    d: DeepManyOpts3?;
}

struct DeepManyOpts1 {
    e: DeepManyOpts2?;
}

contract ManyLevelOptionals {
    f: DeepManyOpts1;
    init() {
        self.f = DeepManyOpts1{
            e: null,
        };
    }
}