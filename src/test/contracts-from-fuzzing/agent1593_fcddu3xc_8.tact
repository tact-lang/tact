struct StringStruct {
    s1: String; 
    s2: String; 
    s3: String;
}

contract TestContract {
    storage: StringStruct;

    init() {
        self.storage = StringStruct{ s1: "hello", s2: "world", s3: "!" };
    }
}