struct OptOmit {
    a: Int;
    b: Int?  // Optional field b, omitted means null
}

contract TestOptOmit {
    receive() {
        let os = OptOmit{ a: 10 };
        dump(os.b); // expected to dump null (or a representation of null)
    }
}
