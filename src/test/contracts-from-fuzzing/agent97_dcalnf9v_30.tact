struct Inner1 { x: Int }
struct Inner2 { y: Int }

struct Wrap2 {
    i1: Inner1;
    i2: Inner2;
}

contract MultipleNestedStructs {
    val: Wrap2;
    init() {
        self.val = Wrap2{
            i1: Inner1{x: 5},
            i2: Inner2{y: 10}
        };
    }
}