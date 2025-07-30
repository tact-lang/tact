// test default values on nested struct fields in contract storage
struct SInner { foo: Int = 7; note: String = "hi"; }

struct SOuter { s: SInner; count: Int = 42; }

contract Test {
    data: SOuter;

    init() {
        self.data = SOuter{
            s: SInner{},
            count: 100
        };
    }
}