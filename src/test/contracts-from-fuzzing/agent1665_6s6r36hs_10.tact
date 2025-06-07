struct S {
    s: String = "foo";
    a: Address;
    nest: Int? = null;
}

contract TestContract {
    data: S;

    init() {
        self.data = S{
            s: "foo",
            a: myAddress(),
            nest: null,
        };
    }
}