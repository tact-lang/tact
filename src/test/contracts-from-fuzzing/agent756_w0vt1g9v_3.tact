struct DefaultsOptional {
    s: String = "hello";
    b: Bool?;    
    i: Int = 123;
}

contract OptionalDefaultsPersistent {
    myField: DefaultsOptional;
    init() {
        self.myField = DefaultsOptional{
            // omit both optional and defaults
        };
    }
}