struct WideProps {
    foo: Int;
    bar: Bool;
    baz: String;
    addr: Address;
}

contract WideStructTwice {
    one: WideProps;
    two: WideProps;

    init() {
        self.one = WideProps{ foo:1, bar:true, baz:"one", addr:myAddress() };
        self.two = WideProps{ foo:2, bar:false, baz:"two", addr:myAddress() };
    }
}