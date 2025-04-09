struct MidStruct {
    foo: Int;
    bar: Int;
}

contract ParamsVsFields(
    x: Int,
    y: Bool,
    ms: MidStruct,
) {
    // No init allowed here, just persistent params
    receive() {
        // trivial receive to include reference to params
        let a = self.x;
        let b = self.y;
        let c = self.ms.foo;
    }
}