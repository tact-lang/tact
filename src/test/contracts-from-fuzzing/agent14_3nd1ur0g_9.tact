struct OptionalStruct {
    x: Int;
    y: Int;
}

contract TestGetterOptional {
    // Persistent state variable of an optional struct, defaults to null
    s: OptionalStruct?;

    receive() {}

    get fun getOptional(): OptionalStruct? {
         return self.s;
    }
}
