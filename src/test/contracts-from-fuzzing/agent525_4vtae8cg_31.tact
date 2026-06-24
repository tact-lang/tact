struct OptOptOpt {
    foo: Int?;
    bar: String?;
    baz: Bool?;
}

contract OptInit {
    thing: OptOptOpt = OptOptOpt{foo:null,bar:null,baz:null};

    init() {
        self.thing = OptOptOpt{ foo:7, bar:"zzz", baz:true };
    }
}