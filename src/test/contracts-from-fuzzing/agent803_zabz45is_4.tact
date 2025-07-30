struct SomeNested {
    innerOpt: String?;
    flag: Bool;
}

struct HasOptionals {
    optInt: Int?;
    optStruct: SomeNested?;
    plainBool: Bool;
}

contract OptionalsStorage {
    complex: HasOptionals;

    init() {
        self.complex = HasOptionals{
            optInt: null,
            optStruct: null,
            plainBool: true
        };
    }
}