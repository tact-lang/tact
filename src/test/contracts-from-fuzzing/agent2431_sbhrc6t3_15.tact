struct Lev3 {
    foo: Int?;
    bar: Bool?;
}

struct Lev2 {
    baz: Int;
    lev3: Lev3;
}

struct Lev1 {
    yes: Lev2?;
    nope: String;
}

contract MixNest {
    persist: Lev1;

    init() {
        self.persist = Lev1{
            yes: Lev2{
                baz:123,
                lev3: Lev3{
                    foo:null,
                    bar:null
                }
            },
            nope: ""
        };
    }
}