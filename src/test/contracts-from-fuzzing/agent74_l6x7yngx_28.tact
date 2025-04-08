struct Outmost {
    mid1: Middle;
    mid2: Middle;
}

struct Middle {
    in1: Inner;
    in2: Inner;
}

struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract Layers {
    data: Outmost;

    init() {
        self.data = Outmost{
            mid1: Middle{
                in1: Inner{a:1,b:true,c:"x"},
                in2: Inner{a:2,b:false,c:"y"},
            },
            mid2: Middle{
                in1: Inner{a:3,b:true,c:"z"},
                in2: Inner{a:4,b:false,c:"w"},
            }
        };
    }
}