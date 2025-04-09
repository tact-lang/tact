struct ManyBools {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
}

contract ManyBoolsTest {
    val: ManyBools;

    init() {
        self.val = ManyBools{
            a:true, b:false, c:true, d:false, e:true, f:false, g:true, h:false
        };
    }
}