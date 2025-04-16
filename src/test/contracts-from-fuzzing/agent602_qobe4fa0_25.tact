struct Inner {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Middle {
    i1: Inner?;
    i2: Inner?;
    i3: Inner?;
    i4: Inner?;
    i5: Inner?;
}

struct Outer {
    m1: Middle;
    m2: Middle;
    m3: Middle;
    m4: Middle;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            m1: Middle{
                i1: null, i2: null, i3: Inner{a:1,b:true,c:"a"}, i4:null, i5:null
            },
            m2: Middle{
                i1: null, i2: Inner{a:2,b:false,c:"b"}, i3:null, i4:null, i5:null
            },
            m3: Middle{
                i1: null, i2:null,i3:null,i4:null,i5:Inner{a:3,b:null,c:null}
            },
            m4: Middle{
                i1:null,i2:null,i3:null,i4:null,i5:null
            },
        };
    }
}