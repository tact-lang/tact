struct Inner {
    a: Int;
    b: String;
}

struct Middle {
    foo: Inner;
    bar: Inner;
}

struct Outer {
    first: Middle;
    second: Middle;
}

contract TestContract {
    myField: Outer?;

    init() {
        self.myField = Outer{
            first: Middle{
                foo: Inner{a:1,b:"x"},
                bar: Inner{a:2,b:"y"}
            },
            second: Middle{
                foo: Inner{a:3,b:"z"},
                bar: Inner{a:4,b:"w"}
            }
        };
    }
    
    receive() {}
}