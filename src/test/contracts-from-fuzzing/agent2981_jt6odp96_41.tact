struct X1 { a: Int; opt: Int?; }

struct X2 { prev: X1; opt2: Bool?; }

struct X3 { above: X2; opt3: String?; }

contract NestedOpts {
    store: X3;

    init() {
        self.store = X3{
            above: X2{
                prev: X1{a:5,opt:null},
                opt2: true,
            },
            opt3: "hi",
        };
    }
}