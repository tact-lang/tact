struct HasBool {
    flag: Bool;
}

struct OptHasBool {
    flag: Bool?;
}

contract ManyStructs {
    one: HasBool;
    two: OptHasBool;
    optOne: HasBool?;
    optTwo: OptHasBool?;
    init() {
        self.one = HasBool{flag: true};
        self.two = OptHasBool{flag: null};
        self.optOne = null;
        self.optTwo = OptHasBool{flag: true};
    }
}