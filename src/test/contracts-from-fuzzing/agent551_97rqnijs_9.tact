contract TestContract(
    foo: Int,
    bar: Int as uint32,
    flag: Bool,
    name: String,
    optionalVal: Int?,
    optionalText: String?,
) {
    receive() {
        // dummy use of the fields to reference
        dump(self.foo);
        dump(self.bar);
        dump(self.flag);
        dump(self.name);
        dump(self.optionalVal);
        dump(self.optionalText);
    }
}