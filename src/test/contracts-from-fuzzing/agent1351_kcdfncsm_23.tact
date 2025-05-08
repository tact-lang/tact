struct IntsAndBools {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
}

contract MixInOut {
    data: IntsAndBools;

    init() {
        self.data = IntsAndBools{
            a:1, b:true, c:2, d:false, e:3
        };
    }
}