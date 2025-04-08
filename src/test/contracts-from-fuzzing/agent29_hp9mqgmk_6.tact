struct OptStruct {
    x: Int?;
    y: Cell?;
    z: Address?;
}

contract TestContract {
    val: OptStruct;
    init() {
        self.val = OptStruct{
            x: null,
            y: null,
            z: null
        };
    }
}