struct BigNest1 {
    a: Int; b: Bool;
}
struct BigNest2 {
    x: String; y: BigNest1;
}
struct BigNest3 {
    k: Bool?; m: BigNest2;
}
struct BigNest4 {
    r: BigNest3; s: String?;
}
contract BigNestTest {
    deep: BigNest4;

    init() {
        self.deep = BigNest4{
            r: BigNest3{
                k: null,
                m: BigNest2{
                    x: "string",
                    y: BigNest1{ a: 77, b: false }
                }
            },
            s: "final"
        };
    }
}