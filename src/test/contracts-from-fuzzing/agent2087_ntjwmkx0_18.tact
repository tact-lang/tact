struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Outer {
    one: Inner;
    two: Inner;
    three: Inner;
}

contract NestedStructsMany {
    data: Outer;

    init() {
        self.data = Outer{
            one: Inner{a:1,b:true,c:"x"},
            two: Inner{a:2,b:false,c:"y"},
            three: Inner{a:3,b:true,c:"z"}
        };
    }
}