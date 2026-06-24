struct DefaultsOptionals {
    a: Int = 5;
    b: Int?;
    c: Bool = false;
    d: Bool?;
    e: String = "hi";
    f: String?;
}

contract OptionalsInStruct {
    s: DefaultsOptionals;

    init() {
        self.s = DefaultsOptionals{
            // rely on defaults and null
            
        };
    }
}