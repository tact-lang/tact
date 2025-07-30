struct Nest1 {
    n2: Nest2;
}

struct Nest2 {
    n3: Nest3;
}

struct Nest3 {
    optInt: Int?;
    optStr: String?;
}

contract CombinedNestedOptionals {
    field: Nest1;
    init() {
        self.field = Nest1{
            n2: Nest2{
                n3: Nest3{
                    optInt: null,
                    optStr: "x",
                }
            }
        };
    }
}
