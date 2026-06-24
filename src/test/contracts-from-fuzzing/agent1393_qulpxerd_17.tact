// Struct with bools and ints interleaved
struct Mixed {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
}

contract MixedFields {
    mix: Mixed;

    init() {
        self.mix = Mixed{a:1,b:true,c:2,d:false,e:3,f:true};
    }
}
