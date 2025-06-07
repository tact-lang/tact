struct Inner1 { a: Int?; }
struct Inner2 { b: Inner1?; }
struct Inner3 { c: Inner2?; }
struct Inner4 { d: Inner3?; }
struct Inner5 { e: Inner4?; }

contract Test {
    deepOpt: Inner5;

    init() {
        self.deepOpt = Inner5{
            e: Inner4{
                d: Inner3{
                    c: null
                }
            }
        };
    }
}