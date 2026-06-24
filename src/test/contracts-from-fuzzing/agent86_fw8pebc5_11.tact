struct Inner1 { a: Int; optB: String?; }
struct Inner2 { c: Inner1; optD: Bool?; }
struct Inner3 { e: Inner2; optF: Address?; }

contract TestContract {
    big: Inner3;

    init() {
        self.big = Inner3{
            e: Inner2{
                c: Inner1{
                    a: 7,
                    optB: null,
                },
                optD: null,
            },
            optF: null,
        };
    }
}