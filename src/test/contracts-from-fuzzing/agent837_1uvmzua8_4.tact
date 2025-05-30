struct InnerMost { val: Int; }
struct Inner2 { i: Int; j: InnerMost; }
struct Inner1 { b: Bool?; k: Inner2; }

contract WideNested {
    state: Inner1;
    init() {
        self.state = Inner1{
            b: false,
            k: Inner2{
                i: 99,
                j: InnerMost{ val: 123 },
            }
        };
    }
}