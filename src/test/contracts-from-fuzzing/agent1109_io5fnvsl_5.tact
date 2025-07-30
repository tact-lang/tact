struct Inner1 { a: Int; }
struct Inner2 { b: Bool; c: Inner1; }
struct Inner3 { d: String; e: Inner2; }

contract DeepContract {
    deep: Inner3;
    init() {
        self.deep = Inner3{
            d: "hi",
            e: Inner2{
                b: true,
                c: Inner1{
                    a: 77,
                },
            },
        };
    }
}