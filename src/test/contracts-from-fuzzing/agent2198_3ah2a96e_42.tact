struct Sub1 {
    val: Int;
    flag: Bool;
}

struct Sub2 {
    one: Sub1;
    note: String;
}

struct Sub3 {
    first: Sub2;
    second: Sub2;
    tag: String;
}

struct Container {
    s3: Sub3;
    sub1: Sub1;
    flag2: Bool;
}

contract MultiNestedRepeat {
    data: Container;
    
    init() {
        self.data = Container{
            s3: Sub3{
                first: Sub2{one: Sub1{val:1, flag:true}, note: "a"},
                second: Sub2{one: Sub1{val:2, flag:false}, note: "b"},
                tag: "tag"
            },
            sub1: Sub1{val:99, flag:false},
            flag2: true
        };
    }
}