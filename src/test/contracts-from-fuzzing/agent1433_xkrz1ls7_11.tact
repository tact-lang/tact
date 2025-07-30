struct OptionalDeep {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

struct Container {
    one: OptionalDeep;
    two: OptionalDeep;
}

contract TestContract {
    opts: Container;
    init() {
        self.opts = Container{
            one: OptionalDeep{ a:1,b:true,c:"s",d:emptyCell(),e:myAddress() },
            two: OptionalDeep{ a:null,b:null,c:null,d:null,e:null },
        };
    }
}