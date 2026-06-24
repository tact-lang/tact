struct LevelThree {
    amount: Int?;
    label: String;
    flag: Bool?;
}

struct LevelTwo {
    extra: LevelThree;
    description: String;
}

struct LevelOne {
    inner: LevelTwo;
    number: Int;
}

contract MultiOptionals {
    store: LevelOne;

    init() {
        self.store = LevelOne{
            number: 999,
            inner: LevelTwo{
                extra: LevelThree{
                    amount: null,
                    label: "foo",
                    flag: true
                },
                description: "bar"
            }
        };
    }
}