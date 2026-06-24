struct MixedOptionals {
    a: Int?;
    b: String;
    c: Bool?;
}

contract TestMixedOptionals {
    val: MixedOptionals = MixedOptionals{
        a:null, b:"", c:null
    };

    init() {
        self.val = MixedOptionals{
            a:123, b:"text", c:true
        };
    }
}
