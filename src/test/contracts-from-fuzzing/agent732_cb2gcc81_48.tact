struct OptInStruct {
    val: Int?;
}

contract TopOptionalField {
    o: OptInStruct?;

    init() {
        self.o = OptInStruct{
            val: null
        };
    }
}