struct Strange {
    one: Int;
    two: Bool;
    three: String?;
    four: Address;
    five: Bool?;
    six: Int;
}

contract TestContract {
    foo: Strange;

    init() {
        self.foo = Strange{
            one:1,two:true,three:null,four:myAddress(),five:false,six:6
        };
    }
}