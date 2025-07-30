struct Inner1 { a: Int }
struct Inner2 { b: Inner1 }
struct Inner3 { c: Inner2 }
struct Inner4 {
    d: Inner3;
    e: Bool;
    f: String;
    g: Address;
}
contract DeepMosaic {
    val: Inner4;

    init() {
        self.val = Inner4{
            d: Inner3{
                c: Inner2{
                    b: Inner1{
                        a: 77
                    }
                }
            },
            e: true,
            f: "fuzz",
            g: myAddress(),
        };
    }
}