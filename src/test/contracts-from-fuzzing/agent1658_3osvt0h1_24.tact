struct Inner1 { a: Int?; }
struct Inner2 { b: Inner1; }
struct Inner3 { c: Inner2; }

contract DeepOptionalNesting {
    val: Inner3;
    init() {
        self.val = Inner3{
            c: Inner2{
                b: Inner1{
                    a: null
                }
            }
        };
    }
}