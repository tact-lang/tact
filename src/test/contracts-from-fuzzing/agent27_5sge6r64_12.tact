struct Inner1 { a: Int; b: Bool }
struct Inner2 { s: String; c: Cell }

struct Nest {
    one: Inner1;
    two: Inner2;
}

contract TestContract {
    data: Nest;
    init() {
        self.data = Nest{
            one: Inner1{a:1,b:true},
            two: Inner2{s:"s",c:emptyCell()}
        };
    }
}
