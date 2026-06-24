struct Compose {
    base: Int;
    flag: Bool;
}

struct Compose2 {
    wrapped: Compose;
}

contract ComposeContract {
    c2: Compose2;
    init() {
        self.c2 = Compose2{
            wrapped: Compose{
                base:99,
                flag:false
            }
        };
    }
}