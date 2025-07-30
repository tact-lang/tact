struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
}

contract TestContract(param: ManyOptionals) {
    receive() {
        let _ = self.param;
    }
}