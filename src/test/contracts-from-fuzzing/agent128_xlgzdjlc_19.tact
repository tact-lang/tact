struct OptionalsFirst {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Int;
    e: Bool;
}

contract TestContract {
    val: OptionalsFirst;

    init() {
        self.val = OptionalsFirst{
            a:null, b:2, c:true, d:4, e:false
        };
    }
}