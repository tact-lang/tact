struct DeepOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
}

contract DeepOptVars {
    val: DeepOptionals;

    init() {
        self.val = DeepOptionals{
            a:null, b:null, c:null, d:null,
            e:null, f:123, g:null
        };
    }
}