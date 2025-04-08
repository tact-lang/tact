struct TupleLike {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TupleLikeTest {
    val: TupleLike;

    init() {
        self.val = TupleLike{
            a: 1,
            b: true,
            c: "abc",
            d: null,
            e: null,
            f: null,
        };
    }
}