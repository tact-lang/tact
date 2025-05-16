struct Nested{
    opt1: Int?;
    opt2: Bool?;
    s: Inner?;
}

struct Inner {
    flag: Bool;
}

contract OptStructs {
    val: Nested;

    init() {
        self.val = Nested{
            opt1: null,
            opt2: true,
            s: Inner{flag:true},
        };
    }
}