struct Inner {
    x: Int?;
    y: Bool?;
    z: String;
}

struct Middle {
    inner: Inner;
    maybe: Inner?;
}

struct Outer {
    left: Middle;
    right: Middle;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            left: Middle{
                inner: Inner{x:3,y:true,z:"foo"},
                maybe: null
            },
            right: Middle{
                inner: Inner{x:null,y:null,z:"bar"},
                maybe: Inner{x:5,y:false,z:"baz"}
            }
        };
    }
}