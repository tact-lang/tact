struct OptionalNumbers {
    one: Int?;
    two: Int?;
    three: Int?;
}

contract StorageOptionalInts {
    vals: OptionalNumbers;

    init() {
        self.vals = OptionalNumbers{
            one:null,
            two:null,
            three:null
        };
    }
}