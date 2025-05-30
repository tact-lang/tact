struct OptionalNestedDeeply {
    one: Inner1?;
}

struct Inner1 {
    two: Inner2?;
}

struct Inner2 {
    three: Inner3?;
}

struct Inner3 {
    val: Int;
}

contract TestContract {
    val: OptionalNestedDeeply;

    init() {
        self.val = OptionalNestedDeeply{
            one: Inner1{
                two: Inner2{
                    three: Inner3{ val: 99 } 
                }
            }
        };
    }
}