struct Deep {
    a: Int;
    b: Bool;
    c: Deep2;
}
struct Deep2 {
    d: Int;
    e: String;
    f: Deep3;
}
struct Deep3 {
    g: Bool;
    h: Address;
}
contract DeepContract {
    val: Deep;
    init() {
        self.val = Deep{
            a: 7,
            b: true,
            c: Deep2{
                d: 8,
                e: "hi",
                f: Deep3{
                    g: false,
                    h: myAddress()
                }
            }
        };
    }
}