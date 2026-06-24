struct NestedMany {
    one: Inner;
    two: Inner;
    three: Inner;
    four: Inner;
    five: Inner;
}

struct Inner {
    n: Int;
    m: Inner2;
    f: Bool;
}

struct Inner2 {
    txt: String;
    flag: Bool?;
    deeper: Inner3;
}

struct Inner3 {
    id: Int;
    label: String?;
}

contract NestedManyTest {
    data: NestedMany;

    init() {
        self.data = NestedMany{
            one: Inner{n:1,m:Inner2{txt:"a",flag:true,deeper:Inner3{id:11,label:"L1"}},f:true},
            two: Inner{n:2,m:Inner2{txt:"b",flag:null,deeper:Inner3{id:12,label:null}},f:false},
            three: Inner{n:3,m:Inner2{txt:"c",flag:false,deeper:Inner3{id:13,label:"L3"}},f:true},
            four: Inner{n:4,m:Inner2{txt:"d",flag:true,deeper:Inner3{id:14,label:null}},f:false},
            five: Inner{n:5,m:Inner2{txt:"e",flag:null,deeper:Inner3{id:15,label:"L5"}},f:true},
        };
    }
}
