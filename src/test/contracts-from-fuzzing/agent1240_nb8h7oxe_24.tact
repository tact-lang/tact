struct OptStruct {
    x: Int?;
}

contract OptTop {
    payload: OptStruct?;
    init() {
        self.payload = null;
    }
}