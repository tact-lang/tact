struct Big {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
    e: Address?;
    f: Bool;
}

contract TestStorage {
    data: Big = Big{
        a: 1,
        b: true,
        c: null,
        d: "test",
        e: null,
        f: false
    };

    receive() {
        let z = self.data;
    }
}