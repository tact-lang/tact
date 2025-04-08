struct Compose1 {
    i: Int;
    s: String;
}

struct Compose2 {
    b: Bool;
    inner: Compose1;
}

contract StructCompose {
    data: Compose2;
    init() {
        self.data = Compose2{
            b: false,
            inner: Compose1{
                i: 9,
                s: "inner",
            },
        };
    }
}
