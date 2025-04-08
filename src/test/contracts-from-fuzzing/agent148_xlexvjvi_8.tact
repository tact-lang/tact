struct HasManyOptionals {
    oi1: Int?;
    oi2: Int?;
    oi3: Int?;
    oi4: Int?;
    oi5: Int?;
}

contract ManyNullables {
    optStruct: HasManyOptionals?;

    init() {
        self.optStruct = null;
    }
}