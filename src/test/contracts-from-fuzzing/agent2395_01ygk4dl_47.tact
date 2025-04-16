struct IntsFirst {
    i1: Int; i2: Int; i3: Int;
    s1: String;
    b1: Bool;
}

contract OrderTest {
    f: IntsFirst;

    init() {
        self.f = IntsFirst{
            i1:1,i2:2,i3:3,s1:"string",b1:true
        };
    }
}
