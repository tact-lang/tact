struct Nested {
    note: String;
    active: Bool;
}

struct MixMax {
    id: Int;
    flag: Bool;
    label: String?;
    count: Int as uint16;
    description: String;
    code: Int?;
    done: Bool?;
    sub: Nested;
}

contract MixMaxContract {
    val: MixMax = MixMax{
        id: 7,
        flag: true,
        label: null,
        count: 123,
        description: "desc",
        code: null,
        done: null,
        sub: Nested{
            note: "xxx",
            active: false
        }
    };

    receive() {
        self.val = self.val;
    }
}