struct InnerOptDefault {
    foo: Int?; // implicitly null by default
}

contract OptDefaultContract {
    data: InnerOptDefault?;
    init() {
        self.data = null;
    }
    receive() {}
}