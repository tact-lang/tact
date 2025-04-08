contract ChainedOptionalStructs {
    a: Inner1?;

    init() {
        self.a = Inner1{
            b: Inner2{
                c: Inner3{
                    val: 10
                }
            }
        };
    }
}

struct Inner1 { b: Inner2?; }
struct Inner2 { c: Inner3?; }
struct Inner3 { val: Int; }
