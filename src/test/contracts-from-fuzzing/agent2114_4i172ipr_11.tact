struct Inner1 { x: Int }
struct Inner2 { y: Bool }
struct Both {
    f1: Inner1;
    f2: Inner2;
}
contract NestedMixed {
    data: Both;

    init() {
        self.data = Both{
            f1: Inner1{x:123},
            f2: Inner2{y:true}
        };
    }
}
