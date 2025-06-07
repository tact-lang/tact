struct MultiNested {
    inner1: Inner1;
    inner2: Inner2;
}

struct Inner1 {
    x: Int;
    y: Int?;
}

struct Inner2 {
    flag: Bool;
    desc: String;
    maybe: Inner3?;
}

struct Inner3 {
    s: String?;
    enabled: Bool;
}

contract MultiNestedStructs {
    full: MultiNested;

    init() {
        self.full = MultiNested{
            inner1: Inner1{ x:1, y:null },
            inner2: Inner2{
                flag:true,
                desc:"start",
                maybe:Inner3{
                    s:null,
                    enabled:false
                }
            }
        };
    }

    receive() {
        if(self.full.inner1.y==null){self.full.inner1.y=0;}else{self.full.inner1.y=self.full.inner1.y!!+1;}
    }
}