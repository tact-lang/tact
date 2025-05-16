struct Nested {
    a: Int;
    opt_b: Bool?;
}

struct Wrapper {
    nested: Nested;
    flag: Bool;
}

contract TestDeep {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            nested: Nested{ a:5, opt_b:null },
            flag:true,
        };
    }
}