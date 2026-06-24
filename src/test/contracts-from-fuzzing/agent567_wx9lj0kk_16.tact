// contract with large set of different primitive and nested optionals
struct X {
    one: Int = 1;
    two: Bool = true;
    three: String = "str";
}

contract Varied {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optStruct: X?;
    init() {
        self.optInt = null;
        self.optBool = null;
        self.optString = null;
        self.optStruct = X{one:11,two:false,three:"hi"};
    }
}
