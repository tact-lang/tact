struct Deep1 { val: Int; opt: Bool?; }
struct Deep2 { d1: Deep1; extra: String; }
struct Deep3 { d2: Deep2; foo: Bool; bar: String; }

contract DeepNest {
    data: Deep3;

    init() {
        self.data = Deep3{
            d2: Deep2{
                d1: Deep1{
                    val: 42,
                    opt: true,
                },
                extra: "abc",
            },
            foo: false,
            bar: "xyz",
        };
    }
}