struct Inner1 {
    a: Int;
    b: Bool;
}

struct Inner2 {
    x: Int?;
    y: String;
}

struct Top {
    s1: Inner1;
    s2: Inner2;
}

contract CombinedNested {
    val: Top;

    init() {
        self.val = Top{
            s1: Inner1{a:1,b:true},
            s2: Inner2{x:null,y:"y"}
        };
    }
}