struct BoolsAndInts {
    a: Bool;
    b: Int;
    c: Bool;
    d: Int;
}

contract MixedSimpleTypes {
    t: BoolsAndInts;

    init() {
        self.t = BoolsAndInts{
            a:true,b:1,c:false,d:2
        };
    }
}