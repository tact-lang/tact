struct MixedOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int;
    e: String;
}

contract TestContract {
    data: MixedOptionals;

    init() {
        self.data = MixedOptionals{
            a:123, b:"abc", c:true, d:5, e:"zzz"
        };
    }
}
