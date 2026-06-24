struct Weird {
    one: Int as uint4;
    two: Int as uint5;
    three: Int as int7;
    four: Int as uint12;
    five: Bool;
    six: Bool?;
}

contract WeirdBits {
    val: Weird;

    init() {
        self.val = Weird{
            one:3, two:17, three:-5, four:200, five:true, six:null
        };
    }
}