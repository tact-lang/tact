struct Child {
    a: Int;
    b: Bool;
    c: String;
}

struct Parent {
    one: Child;
    two: Child;
    three: Child;
}

contract TestContract {
    big: Parent;
    init() {
        self.big = Parent{
            one: Child{a:1,b:true,c:"a"},
            two: Child{a:2,b:false,c:"b"},
            three: Child{a:3,b:true,c:"c"},
        };
    }
}