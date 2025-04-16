struct MixTypes {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    addrVal: Address;
}

contract MixedFieldsContract {
    mix: MixTypes;

    init() {
        self.mix = MixTypes{
            intVal: 1,
            boolVal: true,
            stringVal: "hello",
            addrVal: myAddress()
        };
    }
}