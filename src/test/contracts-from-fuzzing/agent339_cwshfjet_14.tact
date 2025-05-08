struct Mix {
    intVal: Int;
    boolVal: Bool;
    optString: String?;
    optCell: Cell?;
    addr: Address;
}

contract MixStore {
    data: Mix;

    init() {
        self.data = Mix{
            intVal: 1,
            boolVal: true,
            optString: null,
            optCell: null,
            addr: myAddress()
        };
    }
}