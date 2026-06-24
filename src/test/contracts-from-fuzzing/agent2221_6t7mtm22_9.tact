struct Bits {
    one: Bool;
    two: Bool;
    three: Bool;
    four: Bool;
    five: Bool;
    six: Bool;
    seven: Bool;
    eight: Bool;
    nine: Bool;
    ten: Bool;
}

contract TenBools {
    flags: Bits;

    init() {
        self.flags = Bits{
            one:true,two:false,three:true,four:false,five:true,
            six:false,seven:true,eight:false,nine:true,ten:false
        };
    }
}