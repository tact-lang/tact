struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Inner1;
}

contract DeepFields {
    val: Inner2;

    init() {
        self.val = Inner2{
            b: Inner1{ a: 5 }
        };
    }
}